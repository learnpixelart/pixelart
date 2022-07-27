## 3rd party
require 'backgrounds/base'
require 'artfactory/base'



## our own code
require 'moonbirds/version'    # note: let version always go first



module Moonbird

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Pixelart::Module::Moonbirds.root}/config/spritesheet-42x42.png",
                                             "#{Pixelart::Module::Moonbirds.root}/config/spritesheet-42x42.csv",
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
      @generator ||= Artfactory.use(  Moonbird::Sheet.builtin,
                                      image_class: Image )
    end

    def self.generate( *names )
       generator.generate( *names )
    end
  end # class Image
end #  module Moonbird



module Moonbirdie

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Pixelart::Module::Moonbirds.root}/config/spritesheet-24x24.png",
                                             "#{Pixelart::Module::Moonbirds.root}/config/spritesheet-24x24.csv",
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
    def self.generator
      @generator ||= Artfactory.use(  Moonbirdie::Sheet.builtin,
                                      image_class: Image )
    end

    def self.generate( *names )
       generator.generate( *names )
    end
  end # class Image
end #  module Moonbirdie



### add some convenience shortcuts
MoonBird  = Moonbird
Bird      = Moonbird


## add singular too -why? why not?
LilMoonBirdie  = Moonbirdie
LilMoonbirdie  = Moonbirdie
Lilmoonbirdie  = Moonbirdie
MoonBirdie  = Moonbirdie
Birdie      = Moonbirdie
LilBirdie   = Moonbirdie
Lilbirdie   = Moonbirdie
Burd        = Moonbirdie



###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Pixelart::Module::Moonbirds.banner    # say hello
