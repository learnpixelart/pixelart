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



  def initialize( width, height, header: nil )
     @width  = width
     @height = height

     @header = header
     @shapes = []
  end

  def circle( cx:, cy:, r:, fill: )
     @shapes << Circle.new( cx, cy, r, fill: fill )
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
