####################
# to run use:
#   $ ruby ./test_24px.rb


require 'pixelart'


names = %w[
  green
  brown
  gray
  blue
  red
  gold
]

EYES1   =  Image.read( './i/24x24/face/eyes1.png')
MOUTH1  =  Image.read( './i/24x24/face/mouth1.png')  # mouth with teeth
MOUTH2  =  Image.read( './i/24x24/face/mouth2.png')  # mouth
MOUTH3  =  Image.read( './i/24x24/face/mouth3.png')  # smile
MOUTH4  =  Image.read( './i/24x24/face/mouth4.png')  # frown


_3D_GLASSES     =      Image.read( './i/24x24/glasses/3d_glasses.png')
BIG_SHADES      =      Image.read( './i/24x24/glasses/big_shades.png')
REGULAR_SHADES  =      Image.read( './i/24x24/glasses/regular_shades.png')
HEART_SHADES   =      Image.read( './i/24x24/glasses/heart_shades.png')

CAP          =      Image.read( './i/24x24/hat/cap.png')
CAP_FORWARD  =      Image.read( './i/24x24/hat/cap_forward.png')
KNITTED_CAP  =      Image.read( './i/24x24/hat/knitted_cap.png')
BEANIE      =       Image.read( './i/24x24/hat/beanie.png')
TOP_HAT     =       Image.read( './i/24x24/hat/top_hat.png')
BOW         =       Image.read( './i/24x24/hat/bow.png')

PIPE        =       Image.read( './i/24x24/more/pipe.png')


HORNS     =       Image.read( './i/24x24/hat/horns.png')


BOJANGLES1     =           Image.read( './i/24x24/earrings/bojangles1.png')
BOJANGLES2     =           Image.read( './i/24x24/earrings/bojangles2.png')
EARRINGS_DOUBLE_GOLD1 =   Image.read( './i/24x24/earrings/double_gold1.png')
EARRINGS_DOUBLE_GOLD2 =   Image.read( './i/24x24/earrings/double_gold2.png')
EARRING_GOLD1   =         Image.read( './i/24x24/earrings/gold1.png')
EARRING_GOLD2   =         Image.read( './i/24x24/earrings/gold2.png')


SUIT_OPEN        =   Image.read( './i/24x24/clothes/suit-open.png')
SUIT_BLUE_TIE    =   Image.read( './i/24x24/clothes/suit-blue_tie.png')
SUIT_PURPLE_TIE  =   Image.read( './i/24x24/clothes/suit-purple_tie.png')
WHITE_SWEATER    =   Image.read( './i/24x24/clothes/white_sweater.png')
BLUE_SWEATER     =    Image.read( './i/24x24/clothes/blue_sweater.png')
HOODIE           =    Image.read( './i/24x24/clothes/hoodie.png')
BLUE_HOODIE      =    Image.read( './i/24x24/clothes/blue_hoodie.png')
WHITE_SHIRT      =    Image.read( './i/24x24/clothes/white_shirt.png')
BLUE_SHIRT       =    Image.read( './i/24x24/clothes/blue_shirt.png')
GREEN_SHIRT      =    Image.read( './i/24x24/clothes/green_shirt.png')
WHITE_TURTLENECK =    Image.read( './i/24x24/clothes/white_turtleneck.png')

variants = [
  [1,[MOUTH1, EYES1]],   ## none (only eyes & mouth)
  [1,[MOUTH2, EYES1]],   ## none (only eyes & mouth)
  [2,[MOUTH3, EYES1]],   ## none (only eyes & mouth)
  [1,[MOUTH1, _3D_GLASSES, BLUE_SWEATER]],
  [2,[MOUTH3, HORNS, HEART_SHADES, HOODIE]],
  [1,[MOUTH2, EYES1, CAP_FORWARD, SUIT_OPEN, PIPE]],
  [1,[MOUTH4, EYES1, KNITTED_CAP, EARRING_GOLD1, BLUE_SHIRT]],
  [2,[MOUTH1, EYES1, BEANIE, WHITE_TURTLENECK]],
  [1,[MOUTH1, TOP_HAT, REGULAR_SHADES, SUIT_PURPLE_TIE]],
  [2,[MOUTH1, CAP, BIG_SHADES, EARRINGS_DOUBLE_GOLD2, GREEN_SHIRT]],
  [1,[MOUTH3, EYES1, BLUE_HOODIE, BOJANGLES1, BOW]],
]


goblins  = ImageComposite.new( variants.size, names.size,
                                   background: '#638596' )


names.each do |name|
  variants.each_with_index do |rec, i|
    type       = rec[0]
    attributes = rec[1]

    base = Image.read( "./i/24x24/#{name}#{type}.png" )

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


def red_goblin( type: 1 )
  types = %w[1 1i 1ii 2 2i 2ii 3]

  base = Image.new( 24, 24 )
  base.compose!( Image.read( "./i/24x24/red#{types[type-1]}.png" ))
  base.compose!( EYES1 )
  base.compose!( random_mouth )
  base
end

goblins << red_goblin( type: 1 )
variants.each_with_index do |attribute, i|
     goblin = Image.new( 24, 24 )
     type = ((i+1)%7)+1
     goblin.compose!( red_goblin( type: type ))
     goblin.compose!( random_mouth )
     goblin.compose!( attribute )

     goblins << goblin
end

goblins.save( "./tmp/goblins_clothes-24x24.png" )
goblins.zoom(4).save( "./tmp/goblins_clothes-24x24@4x.png" )



puts "bye"