###
#  to run use
#     ruby -I ./lib sandbox/test_doge.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'popart'


#################################
#  200 Dodge

doge =  Image.read( 'i/doge-24x24.png' )


popart = doge.popart

popart.save( "tmp/200_doge.png" )
popart.zoom(2).save( "tmp/200_doge@2x.png" )


popart_grayscale = doge.popart( palette: Palette8bit::GRAYSCALE )

popart_grayscale.save( "tmp/200_doge-grayscale.png" )
popart_grayscale.zoom(2).save( "tmp/200_doge-grayscale@2x.png" )


popart_grayscale_ii = doge.popart( palette: Palette8bit::GRAYSCALE.reverse )

popart_grayscale_ii.save( "tmp/200_doge-grayscale_(2).png" )
popart_grayscale_ii.zoom(2).save( "tmp/200_doge-grayscale_(2)@2x.png" )


popart_sepia = doge.popart( palette: Palette8bit::SEPIA )

popart_sepia.save( "tmp/200_doge-sepia.png" )
popart_sepia.zoom(2).save( "tmp/200_doge-sepia@2x.png" )




popart_blue = doge.popart( palette: Palette8bit::BLUE )

popart_blue.save( "tmp/200_doge-blue.png" )
popart_blue.zoom(2).save( "tmp/200_doge-blue@2x.png" )

popart_blue_ii = doge.popart( palette: Palette8bit::BLUE.reverse )

popart_blue_ii.save( "tmp/200_doge-blue_(2).png" )
popart_blue_ii.zoom(2).save( "tmp/200_doge-blue_(2)@2x.png" )





popart_false = doge.popart( palette: Palette8bit::FALSE )

popart_false.save( "tmp/200_doge-false.png" )
popart_false.zoom(2).save( "tmp/200_doge-false@2x.png" )




module Pixelart

class Image

  ## neon glow special effect
  def neon( color )
    ## note: must convert to black & white sketch
    sketch = sketch( 1 )

    inverse1 = sketch.change_colors( {
              'ffffff' => 0,  ## white to transparent
              '000000' => 'ffffff',  ## black to white
            })

    inverse2 = sketch.change_colors( {
               'ffffff' => 0,  ## white to transparent
               '000000' => color,  ## black to green
             })

####
# inspired by
#   https://css-tricks.com/how-to-create-neon-text-with-css/
#
# .neonText {
#    color: #fff;
#    text-shadow:
#      // white glow
#       0 0 7px #fff,
#       0 0 10px #fff,
#       0 0 21px #fff,
#      // green glow
#       0 0 42px #0fa,
#       0 0 82px #0fa,
#       0 0 92px #0fa,
#       0 0 102px #0fa,
#       0 0 151px #0fa;

    base = Image.new( sketch.width, sketch.height, Color::BLACK )
    base.compose!( inverse2.blur( 21 ) )  # -blur 21x21
    base.compose!( inverse2.blur( 10 ) )  # -blur 10x10
    base.compose!( inverse2.blur( 7 ) )   # -blur 7x7

    base.compose!( inverse1.blur( 2 ) )   # -blur 2x2
    base.compose!( inverse1 )
    base
  end
end # class Image
end # module Pixelart



doge_neon_green = doge.neon(  '00ff00' )
doge_neon_green.save( 'tmp/doge_neon_green.png ' )


popart_neon = doge_neon_green.popart

popart_neon.save( "tmp/200_doge-neon_green.png" )


puts "bye"