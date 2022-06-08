## 3rd party
require 'pixelart/base'



## our own code
require 'backgrounds/version'    # note: let version always go first


## forward define superclass for image
module Backgrounds
  class Image < Pixelart::Image; end
end

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Backgrounds

class Image
  def self.generate( *values,
                       width:,
                       height: )
       img = new( width, height )
       img = do_parse( img, *values )
       img
  end # method Image.generate

  ##
  ##  todo - what syntax to use for stripe/stripes ??
  ##                         or for gradient/gradients ??
  ##  stripe( color1 color2  )  ??
  ##  gradient( color1 color2 )
  def self.do_parse( img, *values )
      head = values[0]
      more = values[1..-1]

      while head do
         img = do_generate( img, head )

         head = more[0]
         more = more[1..-1]
      end
      img
  end

  def self.do_generate( img, value )
    if value.is_a?( String )
      if ['ua','ukraine'].include?( value.downcase )
         img.ukraine
      elsif ['pride','rainbow'].include?( value.downcase )
         img.pride
      else  ### assume color
        img.compose!( Image.new( img.width, img.height, value ) )
        img
      end
    elsif value.is_a?( Pixelart::Image )
      img.compose!( value )
      img
    else ###  assume integer  (assert) - why? why not
      img.compose!( Image.new( img.width, img.height, value ) )
      img
    end
  end

end # class Image
end #  module Backgrounds


### add some convenience shortcuts
## add singular too -why? why not?
Background  = Backgrounds



module Pixelart
class Image
  def background( *values )
    img = Backgrounds::Image.generate( *values,
                                        width:  @img.width,
                                        height: @img.height )
    img.compose!( self )
    img    # note: return new image
  end
end  # class Image
end # module Pixelart




puts Backgrounds.banner    # say hello
