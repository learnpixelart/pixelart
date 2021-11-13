module Pixelart


class Vector   # holds a vector graphics image (in source)

  class Shape; end
  class Circle < Shape
    def initialize( cx, cy, r, fill: )
      @cx   = cx
      @cy   = cy
      @r    = r
      @fill = fill
    end

    def to_svg
      %Q{<circle cx="#{@cx}" cy="#{@cy}" r="#{@r}" fill="#{@fill}" />}
    end

    def to_magick
      ## circle
      ##  give the center and any point on the perimeter (boundary)
      px = @cx+@r
      py = @cy
      "-fill '#{@fill}' -draw 'circle #{@cx},#{@cy},#{px},#{py}'"
    end
  end # class Circle

  class Path < Shape
    def initialize( fill:, stroke: )
      @commands = []
      @fill     = fill
      @stroke   = stroke
    end

    def move_to( x, y )   ## add a move_to instruction
      @commands << ['M', x, y]
      self
    end

    def line_to( x, y )
      @commands << ['L', x, y]
      self
    end

    def line( *coords )  ## move_to/line_to all-in-one shortcut
      ## todo/check - assert coords has at least two x/y pairs - why? why not?
      move_to( *coords[0..1] )
      coords[2..-1].each_slice( 2) do |coord|
        line_to( *coord )
      end
      self
    end



    def to_svg
       buf =  %Q{<path style="stroke: #{@stroke}; fill: #{@fill || 'none'};" }
       buf << %Q{d="}
       last_command = ''
       @commands.each_with_index do |command,i|
          buf << " "  if i > 0  # add space separator

          ## "optimize" - that is, do not repead command if same as before
          buf << command[0]   if command[0] != last_command
          buf << "#{command[1]} #{command[2]}"
          last_command = command[0]
       end

       buf << %Q{"}
       buf << "/>"
       buf
    end
  end # class Path



  def initialize( width, height, header: nil )
     @width  = width
     @height = height

     @header = header
     @shapes = []
  end

  def circle( cx:, cy:, r:, fill: )
     @shapes << Circle.new( cx, cy, r, fill: fill )
  end

  ## note: default stroke (color) to black (#000000) for now - why? why not?
  def path( stroke: '#000000', fill: nil )
     path = Path.new( stroke: stroke, fill: fill )
     @shapes << path

     path   ## note: MUST return "inner" path shape for chaining "dsl-like" methods / commands
  end



  def to_image
     ## use an empty image (canvas) with transparent background
     ##   as magick input image
     canvas = Image.new( @width, @height )
     canvas.save( MAGICK_INPUT )

     ## note: magick command line might get way too long, thus,
     ##   save commands to a script
     ## note: save magick input first (see above) before save script
     ##        will (auto-)create missing directories in path (if missing)

    File.open( MAGICK_SCRIPT, 'w:utf-8' ) do |f|
      f.write( "#{MAGICK_INPUT} \\\n" )
      @shapes.each do |shape|
        f.write( "#{shape.to_magick} \\\n" )
      end
      f.write( "-write #{MAGICK_OUTPUT}\n" )
    end

    MiniMagick::Tool::Magick.new do |magick|
      magick.script( MAGICK_SCRIPT )
    end

    Image.read( MAGICK_OUTPUT )
  end


  def to_svg
    buf = String.new('')

    if @header
      buf << "<!--\n"
      ## auto-indent lines by five (5) spaces for now
      @header.each_line do |line|
        buf << "     #{line}"
      end
      buf << "\n-->\n\n"
    end

    buf << %Q{<svg version="1.1" width="#{@width}" height="#{@height}" xmlns="http://www.w3.org/2000/svg">\n}
    @shapes.each do |shape|
       buf << "  #{shape.to_svg}\n"
    end
    buf << "</svg>"
    buf
  end


  def save( path, format: nil )
    if format && format.downcase == 'png'  ## support png with image magick
      img = to_image
      img.save( path )
    else
     # make sure outdir exits
     outdir = File.dirname( path )
     FileUtils.mkdir_p( outdir )  unless Dir.exist?( outdir )
     File.open( path, 'w:utf-8' ) do |f|
        f.write( to_svg )
      end
    end
  end
  alias_method :write, :save

end # class Vector
end # module Pixelart
