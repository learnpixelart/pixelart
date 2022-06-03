## 3rd party
require 'pixelart/base'



## our own code
require 'goblins/version'    # note: let version always go first


## forward define superclass for image
module Goblins
  class Image < Pixelart::Image; end
end

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Goblins

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                             width:  20,
                                             height: 20 )
  end


  class Image
    def self.generate( *values, background: nil )
       img = Goblins.generator.generate(  *values, background: background )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 20, 20, img.image )
     end # method Image.generate
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Goblins.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
end #  module Goblins


### add some convenience shortcuts
Goblinz = Goblins
## add singular too -why? why not?
Goblin  = Goblins




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Goblins.banner    # say hello
