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
img.save( './tmp/polka-female.png')
img.zoom(3).save( './tmp/polka-femalex3.png')

img = artist.generate( 'male', 1, 3, 2, 3, 1, 1, 5 )
img.save( './tmp/polka-male.png')
img.zoom(3).save( './tmp/polka-malex3.png')


img = artist.random( 'female' )
img.save( './tmp/polka-female-random.png')
img.zoom(3).save( './tmp/polka-female-randomx3.png')

img = artist.random( 'male' )
img.save( './tmp/polka-male-random.png')
img.zoom(3).save( './tmp/polka-male-randomx3.png')


img = artist.random
img.save( './tmp/polka-random1.png')
img.zoom(3).save( './tmp/polka-random1x3.png')

img = artist.random
img.save( './tmp/polka-random2.png')
img.zoom(3).save( './tmp/polka-random2x3.png')

img = artist.random
img.save( './tmp/polka-random3.png')
img.zoom(3).save( './tmp/polka-random3x3.png')



pp artist.types


puts "bye"
