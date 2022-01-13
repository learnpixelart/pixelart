module Pixelart

class ImageComposite < Image  # check: (re)name to Collage, Sheet, Sprites, or such?

  ## default tile width / height in pixel -- check: (re)name to sprite or such? why? why not?
  TILE_WIDTH  = 24
  TILE_HEIGHT = 24


  def self.read( path, width: TILE_WIDTH, height: TILE_WIDTH )   ## convenience helper
    img = ChunkyPNG::Image.from_file( path )
    new( img, width:  width,
              height: width )
  end


  def initialize( *args, **kwargs )
    @tile_width  = kwargs[:width]  || kwargs[:tile_width]  || TILE_WIDTH
    @tile_height = kwargs[:height] || kwargs[:tile_height] || TILE_HEIGHT

    ## check for background
    background = kwargs[:background] || kwargs[:tile_background]

    if background
      ## wrap into an array if not already an array
      ##  and convert all colors to true rgba colors as integer numbers
      background = [background]   unless background.is_a?( Array )
      @background_colors = background.map { |color| Color.parse( color ) }
    else
      ## todo/check: use empty array instead of nil - why? why not?
      @background_colors = nil
    end


    ## todo/fix: check type - args[0] is Image!!!
    if args.size == 1   ## assume "copy" c'tor with passed in image
       img = args[0]    ## pass image through as-is

       @tile_cols  = img.width  / @tile_width       ## e.g. 2400/24 = 100
       @tile_rows  = img.height / @tile_height      ## e.g. 2400/24 = 100
       @tile_count = @tile_cols * @tile_rows       ## ## 10000 = 100x100  (2400x2400 pixel)
    elsif args.size == 2 || args.size == 0     ## cols, rows
      ## todo/fix: check type - args[0] & args[1] is Integer!!!!!
       ## todo/check - find a better name for cols/rows - why? why not?
       @tile_cols = args[0] || 3
       @tile_rows = args[1] || 3
       @tile_count = 0   # (track) current index (of added images)

       background_color = if @background_colors && @background_colors.size == 1
                             @background_colors[0]
                          else
                             0  # note: 0 is transparent (0) true color
                          end

        ## todo/check - always auto-fill complete image (even if empty/no tiles)
        ##                with background color if only one background color
        ##                   why? why not??? or always follow the "model"
        ##                                       with more than one background color???
        img = ChunkyPNG::Image.new( @tile_cols * @tile_width,
                                    @tile_rows * @tile_height,
                                    background_color )

    else
       raise ArgumentError, "cols, rows or image arguments expected; got: #{args.inspect}"
    end


    puts "     #{img.height}x#{img.width} (height x width)"

    super( nil, nil, img )
  end


  def count() @tile_count; end
  alias_method :size, :count   ## add size alias (confusing if starting with 0?) - why? why not?
  alias_method :tile_count, :count

  def tile_width() @tile_width; end
  def tile_height() @tile_height; end



  #####
  # set / add tile
  def _add( image )
    y, x =  @tile_count.divmod( @tile_cols )

    puts "    [#{@tile_count}] @ (#{x}/#{y}) #{image.width}x#{image.height} (height x width)"

    ## note: only used if more than one background color specified
    ##        needs to cycle through
    if @background_colors && @background_colors.size > 1
      i = x + y*@tile_cols

      ## note: cycle through background color for now
      background_color = @background_colors[i % @background_colors.size]
      background = Image.new( @tile_width, @tile_height, background_color )  ## todo/chekc: use "raw" ChunkyPNG:Image here - why? why not?
      background.compose!( image )
      image = background    ## switch - make image with background new image
    end

    ## note: image.image  - "unwrap" the "raw" ChunkyPNG::Image
    @img.compose!( image.image, x*@tile_width, y*@tile_height )
    @tile_count += 1
  end

  def add( image_or_images )   ## note: allow adding of image OR array of images
    if image_or_images.is_a?( Array )
      images = image_or_images
      images.each { |image| _add( image ) }
    else
      image = image_or_images
      _add( image )
    end
  end
  alias_method :<<, :add



  ######
  # get tile

  def tile( index )
    y, x = index.divmod( @tile_cols )
    img = @img.crop( x*@tile_width, y*@tile_height, @tile_width, @tile_height )
    Image.new( img.width, img.height, img )  ## wrap in pixelart image
  end

  def []( *args )    ## overload - why? why not?
    if args.size == 1
      index = args[0]
      tile( index )
    else
      super   ## e.g [x,y] --- get pixel
    end
  end


  ## convenience helpers to loop over composite
  def each( &block )
    count.times do |i|
      block.call( tile( i ) )
    end
  end

  def each_with_index( &block )
    count.times do |i|
      block.call( tile( i ), i )
    end
  end


end # class ImageComposite
end # module Pixelart
