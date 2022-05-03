###
#  to run use
#     ruby -I ./lib sandbox/test_stripes.rb


require 'pixelart/base'


img = Pixelart::Image.read( './i/morepunk88.png' )

at = img.stripes( '#ff0000', '#ffffff', '#ff0000' )
at.save( "./tmp/morepunk88_at.png" )
at.zoom(4).save( "./tmp/morepunk88_at@4x.png" )

at.circle.save( "./tmp/morepunk88_at_(circle).png" )
at.zoom(4).circle.save( "./tmp/morepunk88_at_(circle)@4x.png" )


pride = img.pride
pride.save( "./tmp/morepunk88_pride.png" )
pride.zoom(4).save( "./tmp/morepunk88_pride@4x.png" )

pride.circle.save( "./tmp/morepunk88_pride_(circle).png" )
pride.zoom(4).circle.save( "./tmp/morepunk88_pride_(circle)@4x.png" )


puts "bye"
