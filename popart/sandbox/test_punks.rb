###
#  to run use
#     ruby -I ./lib sandbox/test_punks.rb

$LOAD_PATH.unshift( "../pixelart/lib" )
require 'popart'

$LOAD_PATH.unshift( "../../cryptopunks/cryptopunks/lib" )
require 'cryptopunks'





#################################
#  200 Billie Eilish Punks

billie_eilish = Image.read( 'i/billie_eilish-24x24.png' )

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

mona_lisa = Image.read( 'i/mona_lisa-24x24.png' )


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


###
#  try different attributes

VR         = Punks::Sheet.find_by( name: 'VR',         gender: 'f', size: 's' )
CAP        = Punks::Sheet.find_by( name: 'Cap Red',    gender: 'f', size: 's' )

punk = Image.new( 28, 28 )  ## add padding 4px padding (for overflow)
punk.compose!( mona_lisa, 2, 2 )
punk.compose!( VR,  2, 2 )
punk.compose!( CAP, 1, 2 )
punk = punk.crop( 2, 2, 24, 24 )   ## remove padding again

popart = punk.popart

popart.save( "tmp/200_mona_lisa_(2).png" )
popart.zoom(2).save( "tmp/200_mona_lisa_(2)@2x.png" )



##############################
#  200 Elon Musk Punks

elon_musk = Image.read( 'i/elon_musk-24x24.png' )

elon_musk_white = Image.new( 24, 24, '#ffffff' )
elon_musk_white.compose!( elon_musk )

elon_musk_red = Image.new( 24, 24, '#cc0000' )
elon_musk_red.compose!( elon_musk )


popart = elon_musk_red.popart( checker: elon_musk_white )

popart.save( "tmp/200_elon_musk.png" )
popart.zoom(2).save( "tmp/200_elon_musk@2x.png" )



elon_musk_white = Image.new( 24, 24, '#ffffff' )
elon_musk_white.compose!( elon_musk.grayscale )

elon_musk_red = Image.new( 24, 24, '#cc0000' )
elon_musk_red.compose!( elon_musk.change_palette8bit( Palette8bit::GRAYSCALE.reverse ) )

popart_grayscale = elon_musk_white.popart( checker: elon_musk_red )

popart_grayscale.save( "tmp/200_elon_musk-grayscale.png" )
popart_grayscale.zoom(2).save( "tmp/200_elon_musk-grayscale@2x.png" )


## try (pencil drawing) sketch outline
##

elon_musk_sketch = elon_musk.sketch( line: 3 )

elon_musk_white = elon_musk_sketch.change_colors(
  {
    '#000000' => '#cc0000',   ##   black to "tesla" red
  }
)
elon_musk_red = elon_musk_sketch.change_colors(
  { '#ffffff' => '#cc0000',   ##   white to "tesla" red
    '#000000' => '#ffffff',    ##   black to white
  }
)

elon_musk_red.popart( checker: elon_musk_white ).save( "tmp/200_elon_musk-sketch.png" )




puts "bye"
