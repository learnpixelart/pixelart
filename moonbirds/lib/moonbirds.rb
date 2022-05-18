## 3rd party
require 'pixelart/base'
require 'csvreader'



## our own code
require 'moonbirds/version'    # note: let version always go first


## forward define superclass for image
module Moonbirds
  class Image < Pixelart::Image; end
end

require 'moonbirds/generator'

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Moonbirds

  def self.generator
    @generator ||= Generator.new(  "#{root}/config/spritesheet.png",
                                   "#{root}/config/spritesheet.csv" )
  end


  class Image
    def self.generate( *values, background: nil )
       img = Moonbirds.generator.generate( *values, background: background )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 42, 42, img.image )
     end # method Image.generate
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Moonbirds.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
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
