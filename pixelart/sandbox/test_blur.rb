###
#  to run use
#     ruby -I ./lib sandbox/test_blur.rb


require 'pixelart/base'


img = Pixelart::Image.read( './tmp/mooncat-011.png' )

img.zoom(2).blur(4).save( './tmp/blur-011@2x.png' )
img.zoom(4).blur(10).save( './tmp/blur-011@4x.png' )



puts "bye"