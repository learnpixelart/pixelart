
## our own code (without "top-level" shortcuts e.g. "modular version")
require 'pixelart/colors/base'   # aka "strict(er)" version



##########
#  add some spelling convenience variants
PixelArt = Pixelart

module Pixelart
  Palette256 = Palette8Bit = Palette8bit
end



###
#  add convenience top-level shortcuts / aliases
#    make Image, Color, Palette8bit, etc top-level
include Pixelart


