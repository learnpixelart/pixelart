###
#  to run use
#     ruby -I ./lib sandbox/test_8bit.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart/characters'



###############
### character generation definition
###    list parts by paste / composite order


HUMAN_LIGHTER_BASE1 = '0xead9d9'   # rgb(234 217 217) - hsl(  0°  29%  88%)
HUMAN_LIGHT_BASE1   = '0xdbb180'   # rgb(219 177 128) - hsl( 32°  56%  68%)
HUMAN_DARK_BASE1    = '0xae8b61'   # rgb(174 139  97) - hsl( 33°  32%  53%)
HUMAN_DARKER_BASE1  = '0x713f1d'   # rgb(113  63  29) - hsl( 24°  59%  28%)



CHARACTERS = {
  'male'   => {
    'face' => [{ design: 'male', colors: [HUMAN_LIGHTER_BASE1] },
               { design: 'male', colors: [HUMAN_LIGHT_BASE1] },
               { design: 'male', colors: [HUMAN_DARK_BASE1] },
               { design: 'male', colors: [HUMAN_DARKER_BASE1] }],
    'clothes' => (1..65).to_a,
    'eye'     => (1..32).to_a,
    'mouth'   => (1..26).to_a,
    'hair'    => (1..36).to_a,
  },
  'female' => {
     'face' => [{ design: 'female', colors: [HUMAN_LIGHTER_BASE1] },
                { design: 'female', colors: [HUMAN_LIGHT_BASE1] },
                { design: 'female', colors: [HUMAN_DARK_BASE1] },
                { design: 'female', colors: [HUMAN_DARKER_BASE1] }],
     'clothes' => (1..59).to_a,
     'eye'     => (1..53).to_a,
     'mouth'   => (1..17).to_a,
     'hair'    => (1..33).to_a,
  }
}


pp CHARACTERS


artist = Character.new( CHARACTERS, dir: "../../../cryptopunksnotdead/design.punks/8bit" )


### note convention to start at 1!!!!
###    if 0 than skip/optional!!!!!

img = artist.generate( 'male', 1, 1, 1, 1, 1 )
img.save( './tmp/8bit-male1.png')
img.zoom(4).save( './tmp/8bit-male1x4.png')

img = artist.generate( 'male', 2, 2, 2, 2, 2 )
img.save( './tmp/8bit-male2.png')
img.zoom(4).save( './tmp/8bit-male2x4.png')

img = artist.generate( 'male', 3, 3, 3, 3, 3 )
img.save( './tmp/8bit-male3.png')
img.zoom(4).save( './tmp/8bit-male3x4.png')

img = artist.generate( 'male', 4, 4, 4, 4, 4 )
img.save( './tmp/8bit-male4.png')
img.zoom(4).save( './tmp/8bit-male4x4.png')


img = artist.generate( 'female', 1, 1, 1, 1, 1 )
img.save( './tmp/8bit-female1.png')
img.zoom(4).save( './tmp/8bit-female1x4.png')

img = artist.generate( 'female', 2, 2, 2, 2, 2 )
img.save( './tmp/8bit-female2.png')
img.zoom(4).save( './tmp/8bit-female2x4.png')

img = artist.generate( 'female', 3, 3, 3, 3, 3 )
img.save( './tmp/8bit-female3.png')
img.zoom(4).save( './tmp/8bit-female3x4.png')

img = artist.generate( 'female', 4, 4, 4, 4, 4 )
img.save( './tmp/8bit-female4.png')
img.zoom(4).save( './tmp/8bit-female4x4.png')



img = artist.random( 'male' )
img.save( './tmp/8bit-male-random1.png')
img.zoom(4).save( './tmp/8bit-male-random1x4.png')

img = artist.random( 'female' )
img.save( './tmp/8bit-female-random1.png')
img.zoom(4).save( './tmp/8bit-female-random1x4.png')

img = artist.random
img.save( './tmp/8bit-random1.png')
img.zoom(4).save( './tmp/8bit-random1x4.png')

img = artist.random
img.save( './tmp/8bit-random2.png')
img.zoom(4).save( './tmp/8bit-random2x4.png')




pp artist.types


puts "bye"
