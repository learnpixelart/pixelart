
## our own code (without "top-level" shortcuts e.g. "modular version")
require 'pixelart/base'   # aka "strict(er)" version


###
#  add convenience top-level shortcuts / aliases
#    make Image, Color, Palette8bit, etc top-level
include Pixelart


##########
#  add some spelling convenience variants


module Pixelart
  Palette256Image = Palette8BitImage = Palette8bitImage =
  ImagePalette256 = ImagePalette8Bit = ImagePalette8bit

  CompositeImage = ImageComposite
end

