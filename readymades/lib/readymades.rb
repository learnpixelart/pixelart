## 3rd party
require 'cryptopunks'     ### todo - add/change to cryptopunks/base !!!
require 'backgrounds/base'    ## note: incl. backgrounds for now
                              ##   (may get pulled in by cryptopunks later with update)


## our own code
require 'readymades/version'    # note: let version always go first




###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Readymades

  class Spritesheet       ## note: for now class used for "namespace" only
    def self.builtin    ### check: use a different name e.g. default,standard,base or such - why? why not?
      @sheet ||= Pixelart::Spritesheet.read( "#{Readymades.root}/config/spritesheet.png",
                                             "#{Readymades.root}/config/spritesheet.csv",
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

    def self.generate( *names )
       name       = names[0]
       more_names = names[1..-1]

       base = Readymade::Sheet.find_by( name: name )

       img = new( base.width, base.height )   ## make base a Readymade::Image copy
       img.compose!( base )

       img.add!( *more_names )
       img
    end # method Image.generate


    def add!( *names )
      names.each do |name|
         attribute = Punk::Sheet.find_by( name: name,
                                          gender: 'm' )
         compose!( attribute )
      end
      self
    end

    def add( *names )   ### todo/check: find a better name/alternate names - why? why not?
      img = self.class.new( width, height )  ## make a Readymade::Image copy
      img.compose!( self )

      img.add!( *names)
      img
    end
  end # class Image
end #  module Readymades




### add some convenience shortcuts
ReadyMades = Readymades
## add singular too -why? why not?
Readymade  = Readymades
ReadyMade  = Readymades




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Readymades.banner    # say hello
