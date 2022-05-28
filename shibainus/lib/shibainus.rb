## 3rd party
require 'pixelart/base'



## our own code
require 'shibainus/version'    # note: let version always go first


## forward define superclass for image
module Shibainus
  class Image < Pixelart::Image; end
end

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Shibainus

  def self.generator
    @generator ||= Pixelart::Generator.new(  "#{root}/config/spritesheet.png",
                                             "#{root}/config/spritesheet.csv",
                                             width:  24,
                                             height: 24 )
  end



  class Image
     ## before callback/patch  for hats
     BEFORE_PATCH = ->(img, meta) {
      ## hack for doge hats - cut off / clean top (ears)
       if ['beanie',
           'cap',
           'capforward',
           'cowboyhat',
           'fedora',
           'bandana',
           'tophat',
           'knittedcap'].include?( meta.name )
            puts "  apply doge headwear (for hats & more) hack before '#{meta.name}' - wipe-out pixel lines 3,4,5 (top e.g. doge ears)..."

            ## "wipe-out" pixel lines 3,4,5 (top)
           [3,4,5].each do |y|
              img.width.times do |x|
                 img[ x, y ] = 0  # transparent color
              end
           end
        end
   }


    def self.generate( *values, background: nil )

      img = Shibainus.generator.generate( *values,
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
       Shibainus.generator.find( name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet
end #  module Coolcats


### add some convenience shortcuts
ShibaInus = Shibainus
## add singular too -why? why not?
ShibaInu  = Shibainus
Shibainu  = Shibainus
Shiba     = Shibainus
Shib      = Shibainus

## add doge alias/shortcut too - why? why not?
Doge      = Shibainus


###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Shibainus.banner    # say hello
