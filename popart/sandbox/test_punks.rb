###
#  to run use
#     ruby -I ./lib sandbox/test_punks.rb

require 'popart'

$LOAD_PATH.unshift( "../../cryptopunks/cryptopunks/lib" )
require 'cryptopunks'



#################################
#  200 Billie Eilish Punks

billie_eilish = Image.read( 'i/billie_eilish.png' )

popart = billie_eilish.popart

popart.save( "tmp/200_billie_eilish.png" )
popart.zoom(2).save( "tmp/200_billie_eilish@2x.png" )



popart_grayscale = billie_eilish.popart( palette: Palette8bit::GRAYSCALE )

popart_grayscale.save( "tmp/200_billie_eilish-grayscale.png" )
popart_grayscale.zoom(2).save( "tmp/200_billie_eilish-grayscale@2x.png" )


popart_grayscale_ii = billie_eilish.popart( palette: Palette8bit::GRAYSCALE.reverse )

popart_grayscale_ii.save( "tmp/200_billie_eilish-grayscale_(2).png" )
popart_grayscale_ii.zoom(2).save( "tmp/200_billie_eilish-grayscale_(2)@2x.png" )


popart_sepia = billie_eilish.popart( palette: Palette8bit::SEPIA )

popart_sepia.save( "tmp/200_billie_eilish-sepia.png" )
popart_sepia.zoom(2).save( "tmp/200_billie_eilish-sepia@2x.png" )




popart_blue = billie_eilish.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_billie_eilish-blue.png" )
popart_blue.zoom(2).save( "tmp/200_billie_eilish-blue@2x.png" )

popart_blue_ii = billie_eilish.popart( palette: Palette8bit::BLUE.reverse )

popart_blue_ii.save( "tmp/200_billie_eilish-blue_(2).png" )
popart_blue_ii.zoom(2).save( "tmp/200_billie_eilish-blue_(2)@2x.png" )





popart_false = billie_eilish.popart( palette: Palette8bit::FALSE )

popart_false.save( "tmp/200_billie_eilish-false.png" )
popart_false.zoom(2).save( "tmp/200_billie_eilish-false@2x.png" )


popart_false_ii = billie_eilish.popart( palette: Palette8bit::FALSE,
                               shuffle: true )

popart_false_ii.save( "tmp/200_billie_eilish-false_(2).png" )
popart_false_ii.zoom(2).save( "tmp/200_billie_eilish-false_(2)@2x.png" )


### shuffle in blocks of 32 (colors)  8x32 = 256
def shuffle32( palette )
  palette.each_slice(32).map { |slice| slice }
                        .shuffle
                        .reduce( [] ) { |ary,slice| ary+=slice; ary }
end

popart_false_iii = billie_eilish.popart( palette: Palette8bit::FALSE,
                               shuffle: ->(palette) { shuffle32( palette ) }
                              )

popart_false_iii.save( "tmp/200_billie_eilish-false_(3).png" )
popart_false_iii.zoom(2).save( "tmp/200_billie_eilish-false_(3)@2x.png" )




#########################################
# 200 Mona Lisa Punkettes

mona_lisa = Image.read( 'i/mona_lisa.png' ).mirror


=begin
VR         = Punks::Sheet.find_by( name: 'VR',         gender: 'f', size: 's' )
CAP        = Punks::Sheet.find_by( name: 'Cap Red',    gender: 'f', size: 's' )

punk = Image.new( 28, 28 )  ## add padding 4px padding (for overflow)
punk.compose!( mona_lisa.mirror, 2, 2 )
# punk.compose!( VR,  2, 2 )
punk.compose!( _3D_GLASSES,  2, 2 )
# punk.compose!( CAP, 1, 2 )
=end


_3D_GLASSES = Punks::Sheet.find_by( name: '3D Glasses', gender: 'f', size: 's' )

punk = Image.new( 24, 24 )
punk.compose!( mona_lisa )
punk.compose!( _3D_GLASSES )

popart = punk.popart

popart.save( "tmp/200_mona_lisa.png" )
popart.zoom(2).save( "tmp/200_mona_lisa@2x.png" )


popart_blue = punk.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_mona_lisa-blue.png" )
popart_blue.zoom(2).save( "tmp/200_mona_lisa-blue@2x.png" )



popart_false = punk.popart( palette: Palette8bit::FALSE )

popart_false.save( "tmp/200_mona_lisa-false.png" )
popart_false.zoom(2).save( "tmp/200_mona_lisa-false@2x.png" )



popart_false_iii = punk.popart( palette: Palette8bit::FALSE,
                               shuffle: ->(palette) { shuffle32( palette ) }
                              )

popart_false_iii.save( "tmp/200_mona_lisa-false_(3).png" )
popart_false_iii.zoom(2).save( "tmp/200_mona_lisa-false_(3)@2x.png" )



puts "bye"
