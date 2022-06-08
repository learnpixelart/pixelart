## 3rd party
require 'pixelart/base'



## our own code
require 'backgrounds/version'    # note: let version always go first


## forward define superclass for image
module Backgrounds
  class Image < Pixelart::Image; end
end

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Backgrounds

end #  module Backgrounds


### add some convenience shortcuts
## add singular too -why? why not?
Background  = Backgrounds




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Backgrounds.banner    # say hello
