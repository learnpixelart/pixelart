###############
#  3rd party
require 'chunky_png'

# optional
#   note: requires installed imagemagick command line installed for usage
require 'mini_magick'



## stdlib
require 'pp'
require 'time'
require 'date'
require 'fileutils'

require 'json'
require 'yaml'




## our own code
require 'pixelart/version'    # note: let version always go first
require 'pixelart/color'
require 'pixelart/gradient'
require 'pixelart/palette'
require 'pixelart/image'
require 'pixelart/composite'

require 'pixelart/pixelator'

require 'pixelart/misc'   ## misc helpers

#########################
# (special) effects / filters
require 'pixelart/led'
require 'pixelart/sketch'

## (special) effects / filters that require imagemagick


## todo/check  - use a config block or such - why? why not?
module Pixelart
  MAGICK_SCRIPT = './tmp/magick_script.txt'
  MAGICK_INPUT  = './tmp/magick_input.png'
  MAGICK_OUTPUT = './tmp/magick_output.png'
end

require 'pixelart/spots'
require 'pixelart/blur'







##########
#  add some spelling convenience variants
PixelArt = Pixelart

module Pixelart
  Palette256 = Palette8Bit = Palette8bit

  Palette256Image = Palette8BitImage = Palette8bitImage =
  ImagePalette256 = ImagePalette8Bit = ImagePalette8bit

  CompositeImage = ImageComposite
end



puts Pixelart.banner    # say hello
