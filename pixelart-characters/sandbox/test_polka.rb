###
#  to run use
#     ruby -I ./lib sandbox/test_polka.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart/characters'



###############
### character generation definition
###    list parts by paste / composite order

PARTS = {
  face:  { required: true,
           attributes: [['', 'u'],
                        ['', 'u']] },
  mouth: { required: true,
           attributes: [['Black Lipstick',  'f'],
                        ['Red Lipstick',    'f'],
                        ['Smile',           'u'],
                        ['',                'u'],
                        ['Teeth Smile',     'm'],
                        ['Purple Lipstick', 'f']] },
  nose:  { required: true,
           attributes: [['',          'u'],
                        ['Nose Ring', 'u']] },
  eyes:  { required: true,
           attributes: [['',              'u'],
                        ['Asian Eyes',    'u'],
                        ['Sun Glasses',   'u'],
                        ['Red Glasses',   'u'],
                        ['Round Eyes',    'u']] },
  ears:  { required: true,
           attributes: [['',              'u'],
                        ['Left Earring',  'u'],
                        ['Right Earring', 'u'],
                        ['Two Earrings',  'u']] },
  beard: { required: false,
           attributes: [['Brown Beard',     'm'],
                        ['Mustache-Beard',  'm'],
                        ['Mustache',        'm'],
                        ['Regular Beard',   'm']] },
  hair:  { required: false,
           attributes: [['Up Hair',        'm'],
                        ['Down Hair',      'u'],
                        ['Mahawk',         'u'],
                        ['Red Mahawk',     'u'],
                        ['Orange Hair',    'u'],
                        ['Bubble Hair',    'm'],
                        ['Emo Hair',       'u'],
                        ['Thin Hair',      'm'],
                        ['Bald',           'm'],
                        ['Blonde Hair',    'f']] }
 }

pp PARTS


artist = Character.new( PARTS, dir: "../../../cryptopunksnotdead/programming-cryptopunks/i/parts",
                               format: 'compact' )


### note convention to start at 1!!!!
###    if 0 than skip/optional!!!!!


img = artist.generate( 'female', 2, 2, 2, 3, 1, 6 )
img.zoom(4).save( './tmp/polka-femalex4.png')

img = artist.random( 'female' )
img.zoom(4).save( './tmp/polka-female-randomx4.png')

img = artist.generate( 'male', 1, 3, 2, 3, 1, 1, 5 )
img.zoom(4).save( './tmp/polka-malex4.png')

img = artist.random( 'male' )
img.zoom(4).save( './tmp/polka-male-randomx4.png')

img = artist.random
img.zoom(4).save( './tmp/polka-random1x4.png')

img = artist.random
img.zoom(4).save( './tmp/polka-random2x4.png')

img = artist.random
img.zoom(4).save( './tmp/polka-random3x4.png')



pp artist.types


puts "bye"
