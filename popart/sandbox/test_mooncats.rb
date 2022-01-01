###
#  to run use
#     ruby -I ./lib sandbox/test_mooncats.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'popart'


#################################
#  200 Genesis Mooncats

mooncat_black =  Image.read( 'i/mooncat_black-24x24.png' )
mooncat_white =  Image.read( 'i/mooncat_white-24x24.png' )


popart = mooncat_black.popart

popart.save( "tmp/200_mooncats-black.png" )
popart.zoom(2).save( "tmp/200_mooncats-black@2x.png" )

popart = mooncat_white.popart

popart.save( "tmp/200_mooncats-white.png" )
popart.zoom(2).save( "tmp/200_mooncats-white@2x.png" )

popart = mooncat_black.popart( checker: mooncat_white )

popart.save( "tmp/200_mooncats-black-white.png" )
popart.zoom(2).save( "tmp/200_mooncats-black-white@2x.png" )




popart_sepia = mooncat_white.popart( palette: Palette8bit::SEPIA )

popart_sepia.save( "tmp/200_mooncats-sepia.png" )
popart_sepia.zoom(2).save( "tmp/200_mooncats-sepia@2x.png" )


popart_sepia = mooncat_black.popart( palette: Palette8bit::SEPIA )

popart_sepia.save( "tmp/200_mooncats-sepia_(2).png" )
popart_sepia.zoom(2).save( "tmp/200_mooncats-sepia_(2)@2x.png" )


mooncat_sepia_black = mooncat_black.change_palette8bit( Palette8bit::SEPIA )
mooncat_sepia_white = mooncat_white.change_palette8bit( Palette8bit::SEPIA )

popart_sepia = mooncat_sepia_black.popart( checker: mooncat_sepia_white )

popart_sepia.save( "tmp/200_mooncats-sepia_(3).png" )
popart_sepia.zoom(2).save( "tmp/200_mooncats-sepia_(3)@2x.png" )



popart_blue = mooncat_white.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_mooncats-blue.png" )
popart_blue.zoom(2).save( "tmp/200_mooncats-blue@2x.png" )


popart_blue = mooncat_black.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_mooncats-blue_(2).png" )
popart_blue.zoom(2).save( "tmp/200_mooncats-blue_(2)@2x.png" )




popart_false = mooncat_black.popart( palette: Palette8bit::FALSE )

popart_false.save( "tmp/200_mooncats-false.png" )
popart_false.zoom(2).save( "tmp/200_mooncats-false@2x.png" )


### shuffle in blocks of 32 (colors)  8x32 = 256
def shuffle32( palette )
  palette.each_slice(32).map { |slice| slice }
                        .shuffle
                        .reduce( [] ) { |ary,slice| ary+=slice; ary }
end

popart_false_iii = mooncat_black.popart( palette: Palette8bit::FALSE,
                               shuffle: ->(palette) { shuffle32( palette ) }
                              )

popart_false_iii.save( "tmp/200_mooncats-false_(3).png" )
popart_false_iii.zoom(2).save( "tmp/200_mooncats-false_(3)@2x.png" )



puts "bye"