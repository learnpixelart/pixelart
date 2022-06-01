## 3rd party
require 'cryptopunks'     ### todo - add/change to cryptopunks/base !!!



## our own code
require 'readymades/version'    # note: let version always go first


## forward define superclass for image
module Readymades
  class Image < Pixelart::Image; end
end



###
## todo/fix:
##     use only a spritesheet class
##         not generator for sprite lookup - why? why not?
##      rework generator and break up in
##           two classes (generator + spritesheet) - why? why not?

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Readymades

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                              width:  24,
                                              height: 24 )
  end


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Readymades.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet



  class Image
    def self.generate( *values, background: nil )

       name            = values[0]
       attribute_names = values[1..-1]

       base = Readymade::Sheet.find_by( name: name )

       img = Image.new( 24, 24 )
       img.compose!( base )

       attribute_names.each do |attribute_name|
          attribute = Punk::Sheet.find_by( name: attribute_name,
                                           gender: 'm' )
          img.compose!( attribute )
       end

       if background
          img = if background.is_a?(String) && ['ua', 'ukraine'].include?( background.downcase )
                   img.ukraine
                else
                  img2 = Image.new( 24, 24, background )
                  img2.compose!( img )
                  img2
                end
       end

       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 24, 24, img.image )
     end # method Image.generate
  end # class Image
end #  module Readymades




### add some convenience shortcuts
ReadyMades = Readymades
## add singular too -why? why not?
Readymade  = Readymades
ReadyMade  = Readymades




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Readymades.banner    # say hello
