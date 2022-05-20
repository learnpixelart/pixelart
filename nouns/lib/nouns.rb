## 3rd party
require 'pixelart/base'



## our own code
require 'nouns/version'    # note: let version always go first


## forward define superclass for image
module Nouns
  class Image < Pixelart::Image; end
end


###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Nouns

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                              width:  32,
                                              height: 32 )
  end


  class Image
    def self.generate( *values, background: nil )
       img = Nouns.generator.generate( *values, background: background )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 32, 32, img.image )
     end # method Image.generate
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Nouns.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
end #  module Nouns


### add some convenience shortcuts
## add singular too -why? why not?
Noun      = Nouns




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Nouns.banner    # say hello
