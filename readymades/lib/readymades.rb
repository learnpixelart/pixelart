## 3rd party
require 'cryptopunks'     ### todo - add/change to cryptopunks/base !!!



## our own code
require 'readymades/version'    # note: let version always go first


## forward define superclass for image
module Readymades
  class Image < Pixelart::Image; end
end


### add some convenience shortcuts
ReadyMades = Readymades
## add singular too -why? why not?
Readymade  = Readymades
ReadyMade  = Readymades




###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Readymades.banner    # say hello
