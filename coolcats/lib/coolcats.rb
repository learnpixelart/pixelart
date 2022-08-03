## 3rd party
require 'pixelart/base'



## our own code
require 'coolcats/version'    # note: let version always go first



module Coolcats

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                             width:  24,
                                             height: 24 )
  end


  class Image  < Pixelart::Image

    NAMES = ['coolcat', 'coolcats']

    def self.generate( *values )
      ## note: always auto-add base coolcat archetye by default
       img = Coolcats.generator.generate( 'Base', *values )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 24, 24, img.image )
     end # method Image.generate
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Coolcats.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
end #  module Coolcats


### add some convenience shortcuts
CoolCats = Coolcats
## add singular too -why? why not?
Coolcat  = Coolcats
CoolCat  = Coolcats




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Coolcats.banner    # say hello
