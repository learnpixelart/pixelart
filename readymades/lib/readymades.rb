## 3rd party
require 'cryptopunks'     ### todo - add/change to cryptopunks/base !!!
require 'backgrounds'    ## note: incl. backgrounds for now
                         ##   (may get pulled in by cryptopunks later with update)


## our own code
require 'readymades/version'    # note: let version always go first




###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Readymades

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Readymades.root}/config/spritesheet.png",
                                             "#{Readymades.root}/config/spritesheet.csv",
                                              width:  24,
                                              height: 24 )
    end

    def self.find_by( name: )  ## return archetype/attribute image by name
       builtin.find_by( name: name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet




  class Image < Pixelart::Image
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
          img = if background.is_a?( Array )  ## support multiple background
                  img.background( *background )
                else
                  img.background( background )
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
