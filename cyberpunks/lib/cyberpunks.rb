## 3rd party
require 'pixelart/base'
require 'backgrounds/base'
require 'artfactory/base'



## our own code
require 'cyberpunks/version'    # note: let version always go first



###
## add convenience pre-configurated generatored with build-in spritesheet (see config)
module Cyberpunks
  class Spritesheet
    def self.builtin
      @builtin ||= Pixelart::Spritesheet.read(  "#{Cyberpunks.root}/config/spritesheet.png",
                                                "#{Cyberpunks.root}/config/spritesheet.csv",
                                                 width:  32,
                                                 height: 32 )
    end
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       builtin.find_by( name: name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet


  class Image < Pixelart::Image
    def self.generator
      @generator ||= Artfactory.use(  Cyberpunks::Sheet.builtin,
                                      image_class: Image )
    end

    def self.generate( *names )
       generator.generate( *names )
    end
  end # class Image
end #  module Cyberpunks


### add some convenience shortcuts
CyberPunks = Cyberpunks
## add singular too -why? why not?
Cyberpunk  = Cyberpunks
CyberPunk  = Cyberpunks




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart





puts Cyberpunks.banner    # say hello
