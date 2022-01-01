###
#  to run use
#     ruby -I ./lib sandbox/test_boredapes.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'popart'


#################################
#  200 Laser Eye Bored Apes

ape =  Image.read( 'i/bored_ape-50x50.png' )

popart = ape.popart

popart.save( "tmp/200_bored_apes.png" )
popart.zoom(2).save( "tmp/200_bored_apes@2x.png" )


popart_grayscale = ape.popart( palette: Palette8bit::GRAYSCALE )

popart_grayscale.save( "tmp/200_bored_apes-grayscale.png" )
popart_grayscale.zoom(2).save( "tmp/200_bored_apes-grayscale@2x.png" )


popart_grayscale_ii = ape.popart( palette: Palette8bit::GRAYSCALE.reverse )

popart_grayscale_ii.save( "tmp/200_bored_apes-grayscale_(2).png" )
popart_grayscale_ii.zoom(2).save( "tmp/200_bored_apes-grayscale_(2)@2x.png" )


popart_sepia = ape.popart( palette: Palette8bit::SEPIA )

popart_sepia.save( "tmp/200_bored_apes-sepia.png" )
popart_sepia.zoom(2).save( "tmp/200_bored_apes-sepia@2x.png" )




popart_blue = ape.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_bored_apes-blue.png" )
popart_blue.zoom(2).save( "tmp/200_bored_apes-blue@2x.png" )

popart_blue_ii = ape.popart( palette: Palette8bit::BLUE.reverse )

popart_blue_ii.save( "tmp/200_bored_apes-blue_(2).png" )
popart_blue_ii.zoom(2).save( "tmp/200_bored_apes-blue_(2)@2x.png" )





popart_false = ape.popart( palette: Palette8bit::FALSE )

popart_false.save( "tmp/200_bored_apes-false.png" )
popart_false.zoom(2).save( "tmp/200_bored_apes-false@2x.png" )


puts "bye"