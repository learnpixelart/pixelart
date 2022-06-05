## 3rd party
require 'pixelart/base'



## our own code
require 'belles/version'    # note: let version always go first


## forward define superclass for image
module Belles
  class Image < Pixelart::Image; end
end

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Belles

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                             width:  24,
                                             height: 24 )
  end


  class Image
     ## before callback/patch  for hats
     BEFORE_PATCH = ->(img, meta) {
      ## hack for hats & hair - clip head "overflow"
      ##  quick hack for headwear
      ##   cut-off/clean top overflow hair/head
      if meta.name.start_with?( 'beret' ) ||
         meta.name.start_with?( 'snap_back' )
           img[6,4] = 0
           img[7,3] = 0
           puts "  apply beau/belle hat & hair hack before '#{meta.name}' - clip head pixels..."
      elsif meta.name.start_with?( 'beanie' ) ||
            meta.name.start_with?( 'dreads' )
          img[6,4] = 0
          puts "  apply beau/belle hat & hair hack before '#{meta.name}' - clip head pixels..."
      else
          # do nothing; pass through as-is
      end
  }

    def self.generate( *values, background: nil )
       img = Belles.generator.generate( *values,
                                        background: background,
                                        before: BEFORE_PATCH )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( 24, 24, img.image )
     end # method Image.generate
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Belles.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
end #  module Belles


### add some convenience shortcuts
Beaux = Belles
## add singular too -why? why not?
Belle  = Belles
Bella  = Belles
Beau   = Belles


###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Belles.banner    # say hello
