###
#  to run use
#     ruby -I ./lib sandbox/test_ukraine.rb


require 'pixelart/base'


img = Pixelart::Image.read( './i/morepunk88.png' )

img.ukraine.save( "./tmp/morepunk88_ukraine.png" )
img.ukraine.zoom(4).save( "./tmp/morepunk88_ukraine@4x.png" )



puts "bye"