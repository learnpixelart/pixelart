## 3rd party
require 'backgrounds/base'
require 'artfactory/base'



## our own code
require 'smileys/version'    # note: let version always go first



module Smiley16

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Pixelart::Module::Smileys.root}/config/spritesheet_dia16-24x24.png",
                                             "#{Pixelart::Module::Smileys.root}/config/spritesheet_dia16-24x24.csv",
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
      @generator ||= Artfactory.use(  Smiley16::Sheet.builtin,
                                      image_class: Image )
    end


    NAMES = ['smiley16', 'smileys16' ]
    DEFAULT_ATTRIBUTES = ['Yellow', 'Face 1']

    def self.generate( *names )
       generator.generate( *names )
    end
  end # class Image
end





###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart


puts Pixelart::Module::Smileys.banner    # say hello

