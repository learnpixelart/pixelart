###
#  to run use
#     ruby -I ./lib sandbox/test_composite.rb


require 'pixelart/base'


RED    = '#ff0000'
GREEN  = '#00ff00'
BLUE   = '#0000ff'
YELLOW = '#ffff00'
BLACK  = '#000000'

composite = Pixelart::ImageComposite.new( 3, 3, background: RED )

tile = Pixelart::Image.new( 24, 24 )
tile.compose!( Pixelart::Image.new( 12, 12, BLACK ), 6, 6 )


composite << tile
composite << tile
composite << [tile, tile, tile]
composite << tile

composite.save( "./tmp/composite_background3x3.png" )
composite.zoom(3).save( "./tmp/composite_background3x3@3x.png")


composite = Pixelart::ImageComposite.new( 3, 3, background: [RED, GREEN, BLUE, YELLOW] )

composite << tile
composite << tile
composite << [tile, tile, tile]
composite << tile

composite.save( "./tmp/composite_background3x3_(2).png" )
composite.zoom(3).save( "./tmp/composite_background3x3_(2)@3x.png")


puts "bye"
