module Pixelart

class Image

def blur( blur=2 )
  @img.save( MAGICK_INPUT )

  MiniMagick::Tool::Magick.new do |magick|
    magick << MAGICK_INPUT
    magick.blur( "#{blur}x#{blur}" )
    magick << MAGICK_OUTPUT
  end

  Image.read( MAGICK_OUTPUT )
end

end # class Image
end # class Pixelart

