####################
# to run use:
#   $ ruby sandbox/generate_24px.rb


require 'pixelart'


names = %w[
  green
  brown
  gray
  red
  gold
]

EYES1   =  Image.read( './spritesheet/i/24x24/face/eyes1.png')
EYES2   =  Image.read( './spritesheet/i/24x24/face/eyes2.png')

_3D_GLASSES     =      Image.read( './spritesheet/i/24x24/glasses/3d_glasses.png')
BIG_SHADES      =      Image.read( './spritesheet/i/24x24/glasses/big_shades.png')
REGULAR_SHADES  =      Image.read( './spritesheet/i/24x24/glasses/regular_shades.png')
HEART_SHADES   =      Image.read( './spritesheet/i/24x24/glasses/heart_shades.png')

CAP          =      Image.read( './spritesheet/i/24x24/hat/cap.png')
CAP_FORWARD  =      Image.read( './spritesheet/i/24x24/hat/cap_forward.png')
KNITTED_CAP  =      Image.read( './spritesheet/i/24x24/hat/knitted_cap.png')
BEANIE      =       Image.read( './spritesheet/i/24x24/hat/beanie.png')
TOP_HAT     =       Image.read( './spritesheet/i/24x24/hat/top_hat.png')
BOW         =       Image.read( './spritesheet/i/24x24/hat/bow.png')

PIPE        =       Image.read( './spritesheet/i/24x24/more/pipe.png')


HORNS     =       Image.read( './spritesheet/i/24x24/hat/horns.png')


BOJANGLES     =           Image.read( './spritesheet/i/24x24/earrings/bojangles.png')
EARRINGS_DOUBLE_GOLD =   Image.read( './spritesheet/i/24x24/earrings/double_gold.png')
EARRING_GOLD   =         Image.read( './spritesheet/i/24x24/earrings/gold.png')

SUIT_PURPLE_TIE  =   Image.read( './spritesheet/i/24x24/clothes/suit-purple_tie.png')
BLUE_SWEATER     =    Image.read( './spritesheet/i/24x24/clothes/blue_sweater.png')
HOODIE           =    Image.read( './spritesheet/i/24x24/clothes/hoodie.png')
BLUE_HOODIE      =    Image.read( './spritesheet/i/24x24/clothes/blue_hoodie.png')
BLUE_SHIRT       =    Image.read( './spritesheet/i/24x24/clothes/blue_shirt.png')

variants = [
  [EYES1],   ## none (only eyes)
  [_3D_GLASSES, BLUE_SWEATER],
  [HORNS, HEART_SHADES, HOODIE],
  [EYES1, CAP_FORWARD, SUIT_PURPLE_TIE, PIPE],
  [EYES1, KNITTED_CAP, EARRING_GOLD, BLUE_SHIRT],
  [EYES1, BEANIE, BLUE_SWEATER],
  [TOP_HAT, REGULAR_SHADES, SUIT_PURPLE_TIE],
  [CAP, BIG_SHADES, EARRINGS_DOUBLE_GOLD, BLUE_SHIRT],
  [EYES1, BOJANGLES, BLUE_HOODIE, BOW],
]


gremlins  = ImageComposite.new( variants.size, names.size,
                                   background: '#638596',
                                   width: 24,
                                   height: 24 )


names.each do |name|
  base = Image.read( "./spritesheet/i/24x24/#{name}.png" )

  variants.each_with_index do |attributes, i|
     gremlin = Image.new( 24, 24 )
     gremlin.compose!( base )
     attributes.each do |attribute|
      gremlin.compose!( attribute )
     end

     gremlin.save( "./tmp/#{name}#{i}-24x24.png")
     gremlin.zoom(4).save( "./tmp/#{name}#{i}-24x24@4x.png")

     gremlins << gremlin
  end
end

gremlins.save( "./tmp/goblins-24x24.png" )
gremlins.zoom(4).save( "./tmp/goblins-24x24@4x.png" )


puts "bye"