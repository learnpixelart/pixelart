require 'cocos'
require 'base64'
require 'strscan'  ## todo/fix: auto-add strscan in cocos - why? why not?


###
#   base module
require 'pixelart/colors'



###############
#  3rd party
require 'chunky_png'

# optional
#   note: requires installed imagemagick command line installed for usage
require 'mini_magick'



## our own code
require 'pixelart/version'    # note: let version always go first
require 'pixelart/image'
require 'pixelart/composite'

require 'pixelart/sample'   ## (down)sample / pixelate


require 'pixelart/pixelator'

require 'pixelart/misc'   ## misc helpers
require 'pixelart/stripes'


require 'pixelart/generator'   ## generate images from text via spritesheets


#########################
# (special) effects / filters / etc
require 'pixelart/circle'
require 'pixelart/led'
require 'pixelart/sketch'
require 'pixelart/transparent'
require 'pixelart/silhouette'
require 'pixelart/invert'
require 'pixelart/ukraine'


## (special) effects / filters that require imagemagick


## todo/check  - use a config block or such - why? why not?
module Pixelart
  MAGICK_SCRIPT = './tmp/magick_script.txt'
  MAGICK_INPUT  = './tmp/magick_input.png'
  MAGICK_OUTPUT = './tmp/magick_output.png'
end

require 'pixelart/vector'   ## vector graphics helpers


require 'pixelart/spots'
require 'pixelart/blur'



###
# mover helpers / utils
require 'pixelart/convert'




puts Pixelart.banner    # say hello
