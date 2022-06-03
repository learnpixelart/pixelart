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
MOUTH1  =  Image.read( './spritesheet/i/24x24/face/mouth1.png')  # mouth with teeth
MOUTH2  =  Image.read( './spritesheet/i/24x24/face/mouth2.png')  # mouth
MOUTH3  =  Image.read( './spritesheet/i/24x24/face/mouth3.png')  # smile
MOUTH4  =  Image.read( './spritesheet/i/24x24/face/mouth4.png')  # frown
EARS2   =  Image.read( './spritesheet/i/24x24/face/ears2.png')  # pointy ears


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
  [MOUTH1, EYES1],   ## none (only eyes & mouth)
  [MOUTH2, EYES1],   ## none (only eyes & mouth)
  [MOUTH3, EYES1, EARS2],   ## none (only eyes & mouth)
  [MOUTH1, _3D_GLASSES, BLUE_SWEATER],
  [MOUTH3, EARS2, HORNS, HEART_SHADES, HOODIE],
  [MOUTH2, EYES1, CAP_FORWARD, SUIT_PURPLE_TIE, PIPE],
  [MOUTH4, EYES1, KNITTED_CAP, EARRING_GOLD, BLUE_SHIRT],
  [MOUTH1, EYES1, EARS2, BEANIE, BLUE_SWEATER],
  [MOUTH1, TOP_HAT, REGULAR_SHADES, SUIT_PURPLE_TIE],
  [MOUTH1, CAP, BIG_SHADES, EARRINGS_DOUBLE_GOLD, BLUE_SHIRT],
  [MOUTH3, EYES1, BOJANGLES, BLUE_HOODIE, BOW],
]


goblins  = ImageComposite.new( variants.size, names.size,
                                   background: '#638596' )


names.each do |name|
  base = Image.read( "./spritesheet/i/24x24/#{name}.png" )

  variants.each_with_index do |attributes, i|
     goblin = Image.new( 24, 24 )
     goblin.compose!( base )
     attributes.each do |attribute|
      goblin.compose!( attribute )
     end

     goblin.save( "./tmp/#{name}#{i}-24x24.png")
     goblin.zoom(4).save( "./tmp/#{name}#{i}-24x24@4x.png")

     goblins << goblin
  end
end

goblins.save( "./tmp/goblins-24x24.png" )
goblins.zoom(4).save( "./tmp/goblins-24x24@4x.png" )





goblins  = ImageComposite.new( 4, 3,
                                  background: '#ffbf00' )


variants = [
  SUIT_OPEN,
  SUIT_BLUE_TIE,
  SUIT_PURPLE_TIE,
  WHITE_SWEATER,
  BLUE_SWEATER,
  HOODIE,
  BLUE_HOODIE,
  WHITE_SHIRT,
  BLUE_SHIRT,
  GREEN_SHIRT,
  WHITE_TURTLENECK
]


RANDOM_MOUTH = [
  MOUTH1,
  MOUTH2,
  MOUTH3]
def random_mouth() RANDOM_MOUTH[ rand(RANDOM_MOUTH.size) ]; end



base = Image.new( 24, 24 )
base.compose!( Image.read( "./spritesheet/i/24x24/green.png" ))
base.compose!( EYES1 )
base.compose!( random_mouth )


goblins << base
variants.each_with_index do |attribute, i|
     goblin = Image.new( 24, 24 )
     goblin.compose!( base )
     goblin.compose!( random_mouth )
     goblin.compose!( attribute )

     goblins << goblin
end

goblins.save( "./tmp/goblins_clothes-24x24.png" )
goblins.zoom(4).save( "./tmp/goblins_clothes-24x24@4x.png" )



puts "bye"