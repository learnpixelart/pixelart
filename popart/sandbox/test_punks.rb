###
#  to run use
#     ruby -I ./lib sandbox/test_punks.rb

require 'popart'



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



composite = ImageComposite.new( 1, 3, width:  popart.width,
                                      height: popart.height )
composite << popart
composite << popart_blue
composite << popart_false

composite.save( "tmp/200_composite.png" )
composite.zoom(2).save( "tmp/200_composite@2x.png" )



puts "bye"
