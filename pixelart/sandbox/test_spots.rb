###
#  to run use
#     ruby -I ./lib sandbox/test_spots.rb


require 'pixelart/base'


img = Pixelart::Image.read( './tmp/mooncat-011.png' )

img.spots( 10 ).save( './tmp/spots-011.png' )
img.zoom(2).spots( 5, spacing: 5,
                      center: [-1,1], radius: [3,6] ).save( './tmp/spots-011@2x.png' )




img = Pixelart::Image.new( 24, 24 )
# 20x21  - place in 24x24 canvas
#  add x-offset +2, y-offset +1
img.compose!( Pixelart::Image.read( './tmp/mooncat-0077c8278d.png' ), 2, 1 )

img.spots( 10 ).save( './tmp/spots-0077c8278d.png' )
img.zoom(2).spots( 5, spacing: 5,
                      center: [-1,1], radius: [3,6] ).save( './tmp/spots-0077c8278d@2x.png' )


puts "bye"