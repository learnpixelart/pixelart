module Pixelart


class Pixelator    # or use Minifier or such - rename - why? why not?

  def initialize( img, width=24, height=24 )
    @img    = img.is_a?( Image ) ? img.image : img  ## "unwrap" if Pixelart::Image
    @width  = width
    @height = height

    ## calculate pixel size / density / resolution
    ##   how many pixels per pixel?
    @xsize, @xoverflow = img.width.divmod( width )
    @ysize, @yoverflow = img.height.divmod( height )

    puts "minify image size from (#{@img.width}x#{@img.height}) to (#{width}x#{height})"
    puts "  pixel size (#{@xsize}x#{@ysize}) - #{@xsize*@ysize} pixel(s) per pixel"
    puts "    overflow x: #{@xoverflow}, y: #{@yoverflow} pixel(s)"    if @xoverflow > 0 || @yoverflow > 0
  end


  def grid( spacing: 10 )
    width  = @img.width  + (@width-1)*spacing
    height = @img.height + (@height-1)*spacing

    img = ChunkyPNG::Image.new( width, height, ChunkyPNG::Color::WHITE )

    @img.width.times do |x|
      xpixel = x/@xsize
      @img.height.times do |y|
        ypixel = y/@ysize

        ## clip overflow pixels
        xpixel = @width-1   if xpixel >= @width
        ypixel = @height-1  if ypixel >= @height

        color = @img[x,y]
        img[x + spacing*xpixel,
            y + spacing*ypixel] = color
      end
    end

    Image.new( img.width, img.height, img )  ## wrap in Pixelart::Image - why? why not?
  end


  # pixels by coordinates (x/y) with color statistics / usage
  def pixels
    @pixels ||= begin
                  pixels = []
                  @img.width.times do |x|
                    xpixel = x/@xsize
                    @img.height.times do |y|
                      ypixel = y/@ysize

                      ## skip/cut off overflow pixels
                      next if xpixel >= @width || ypixel >= @height

                      color = @img[x,y]
                      colors = pixels[xpixel+ypixel*@width] ||= Hash.new(0)
                      colors[ color ] += 1
                    end
                  end

                  ## sort pixel colors by usage / count (highest first)
                  pixels = pixels.map do |pixel|
                                         pixel.sort do |l,r|
                                                      r[1] <=> l[1]
                                                    end.to_h
                                      end
                  pixels
                end
  end

  def pixel(x,y)  pixels[x+y*@width]; end
  alias_method :[], :pixel


  def can_pixelate?
    # check if any pixel has NOT a color with a 50% majority?
    count = 0
    @width.times do |x|
      @height.times do |y|
        pixel = pixel( x, y )
        sum         = pixel.values.sum
        color_count = pixel.values[0]
        if color_count < (sum/2)
          count += 1
          ## todo/check: stor warn in a public errors or warns array - why? why not?
          puts "!! WARN #{count} - pixel (#{x}/#{y}) - no majority (50%) color:"
          pp pixel
        end
      end
    end

    count == 0    ## return true if not warnings found
  end
  alias_method :pixelate?, :can_pixelate?


  def pixelate
    img = ChunkyPNG::Image.new( @width, @height )

    @width.times do |x|
      @height.times do |y|
        pixel = pixel( x, y )
        color = pixel.keys[0]
        img[x,y] = color
      end
    end

    Image.new( img.width, img.height, img )  ## wrap in Pixelart::Image - why? why not?
  end
end  # class Pixelator
end  # module Pixelart


