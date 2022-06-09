## 3rd party
require 'pixelart/base'
require 'spritesheet/base'


## our own code
require 'backgrounds/version'    # note: let version always go first
require 'backgrounds/image'




module Pixelart
class Image
  def background( *values )
    img = Background::Image.generate( *values,
                                        width:  @img.width,
                                        height: @img.height )
    img.compose!( self )
    img    # note: return new image
  end
end  # class Image
end # module Pixelart



puts Pixelart::Module::Backgrounds.banner    # say hello
