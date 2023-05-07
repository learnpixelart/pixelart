###
#  to run use
#     ruby -I ./lib sandbox/test_invert.rb


require 'pixelart/base'


img = Pixelart::Image.read( './i/mooncat_white.png' )

invert = img.invert
invert.save( "./tmp/invert-mooncat_white.png" )
invert.zoom(4).save( "./tmp/invert-mooncat_white@4x.png" )


img = Pixelart::Image.read( './i/mooncat_black.png' )

invert = img.invert
invert.save( "./tmp/invert-mooncat_black.png" )
invert.zoom(4).save( "./tmp/invert-mooncat_black@4x.png" )


img = Pixelart::Image.read( './i/sketch.png' )

invert = img.invert
invert.save( "./tmp/invert-sketch.png" )
invert.zoom(4).save( "./tmp/invert-sketch@4x.png" )


img = Pixelart::Image.read( './i/neon.png' )

invert = img.invert
invert.save( "./tmp/invert-neon.png" )
invert.zoom(4).save( "./tmp/invert-neon@4x.png" )


puts "bye"