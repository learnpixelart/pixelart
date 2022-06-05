##############################
#  test  goblin 1/1 originals / new designs
#
# to run use:
#   $ ruby sandbox/originals.rb


require 'pixelart'



originals = []
(1..4).each do |i|
  originals <<  Image.read( "./sandbox/i/goblin#{i}.png" )
end


CAP          =      Image.read( './spritesheet/i/24x24/hat/cap.png')
CAP_FORWARD  =      Image.read( './spritesheet/i/24x24/hat/cap_forward.png')
KNITTED_CAP  =      Image.read( './spritesheet/i/24x24/hat/knitted_cap.png')
BEANIE      =       Image.read( './spritesheet/i/24x24/hat/beanie.png')
TOP_HAT     =       Image.read( './spritesheet/i/24x24/hat/top_hat.png')
BOW         =       Image.read( './spritesheet/i/24x24/hat/bow.png')

PIPE        =       Image.read( './spritesheet/i/24x24/more/pipe.png')


HORNS     =       Image.read( './spritesheet/i/24x24/hat/horns.png')


BOJANGLES2     =           Image.read( './spritesheet/i/24x24/earrings/bojangles2.png')
EARRINGS_DOUBLE_GOLD2 =   Image.read( './spritesheet/i/24x24/earrings/double_gold2.png')
EARRING_GOLD2   =         Image.read( './spritesheet/i/24x24/earrings/gold2.png')


SUIT_OPEN        =   Image.read( './spritesheet/i/24x24/clothes/suit-open.png')
SUIT_BLUE_TIE    =   Image.read( './spritesheet/i/24x24/clothes/suit-blue_tie.png')
SUIT_PURPLE_TIE  =   Image.read( './spritesheet/i/24x24/clothes/suit-purple_tie.png')
WHITE_SWEATER    =   Image.read( './spritesheet/i/24x24/clothes/white_sweater.png')
BLUE_SWEATER     =    Image.read( './spritesheet/i/24x24/clothes/blue_sweater.png')
HOODIE           =    Image.read( './spritesheet/i/24x24/clothes/hoodie.png')
BLUE_HOODIE      =    Image.read( './spritesheet/i/24x24/clothes/blue_hoodie.png')
WHITE_SHIRT      =    Image.read( './spritesheet/i/24x24/clothes/white_shirt.png')
BLUE_SHIRT       =    Image.read( './spritesheet/i/24x24/clothes/blue_shirt.png')
GREEN_SHIRT      =    Image.read( './spritesheet/i/24x24/clothes/green_shirt.png')
WHITE_TURTLENECK =    Image.read( './spritesheet/i/24x24/clothes/white_turtleneck.png')

variants = [
  [],  ## empty/none
  [HORNS, HOODIE],
  [CAP_FORWARD, SUIT_OPEN, PIPE],
  [EARRINGS_DOUBLE_GOLD2, BLUE_SHIRT],
  [BLUE_HOODIE, BOJANGLES2, BOW],
]


goblins  = ImageComposite.new( variants.size, originals.size )


originals.each do |base|
  variants.each_with_index do |attributes, i|
     goblin = Image.new( 24, 24 )
     goblin.compose!( base )
     attributes.each do |attribute|
      goblin.compose!( attribute )
     end

     goblins << goblin
  end
end

goblins.save( "./tmp/goblins_originals-24x24.png" )
goblins.zoom(4).save( "./tmp/goblins_originals-24x24@4x.png" )



puts "bye"