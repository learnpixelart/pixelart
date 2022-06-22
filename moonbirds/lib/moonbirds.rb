## 3rd party
require 'backgrounds/base'
require 'artfactory/base'



## our own code
require 'moonbirds/version'    # note: let version always go first



module Moonbirds

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Moonbirds.root}/config/spritesheet.png",
                                             "#{Moonbirds.root}/config/spritesheet.csv",
                                              width:  42,
                                              height: 42 )
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
    def self.generator
      @generator ||= Artfactory.use(  Moonbirds::Sheet.builtin,
                                      image_class: Image )
    end

    def self.generate( *names )
       generator.generate( *names )
    end
  end # class Image
end #  module Moonbirds



### add some convenience shortcuts
MoonBirds = Moonbirds
Birds     = Moonbirds
## add singular too -why? why not?
Moonbird  = Moonbirds
MoonBird  = Moonbirds
Bird      = Moonbirds




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Moonbirds.banner    # say hello
