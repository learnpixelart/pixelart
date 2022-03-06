###
#  to run use
#     ruby -I ./lib sandbox/test_ukraine.rb


require 'pixelart/base'


img = Pixelart::Image.read( './i/morepunk88.png' )

img.ukraine.save( "./tmp/morepunk88_ukraine.png" )
img.ukraine.zoom(4).save( "./tmp/morepunk88_ukraine@4x.png" )

img.ukraine.circle.save( "./tmp/morepunk88_ukraine_(circle).png" )
img.ukraine.circle.zoom(4).save( "./tmp/morepunk88_ukraine_circle@4x.png" )

img.ukraine.zoom(4).circle.save( "./tmp/morepunk88_ukraine@4x_(circle).png" )
img.ukraine.zoom(8).circle.save( "./tmp/morepunk88_ukraine@8x_(circle).png" )

puts "bye"
