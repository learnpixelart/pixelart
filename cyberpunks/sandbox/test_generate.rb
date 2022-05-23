###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'cyberpunks'

###
#  try attribute lookup

skull_gold       = Cyberpunk::Sheet.find_by( name: 'Skull Gold' )
egirl_hair       = Cyberpunk::Sheet.find_by( name: 'E-Girl Hair' )
sun_glasses      = Cyberpunk::Sheet.find_by( name: 'Sun Glasses' )
jack_o_lantern   = Cyberpunk::Sheet.find_by( name: "Jack-O'-Lantern" )

skull_gold.save( "./tmp/skull_gold.png" )
egirl_hair.save( "./tmp/egirl_hair.png" )
sun_glasses.save( "./tmp/sun_glasses.png" )
jack_o_lantern.save( "./tmp/jack_o_lantern.png" )

skull_gold.zoom( 4 ).save( "./tmp/skull_gold@4x.png" )
egirl_hair.zoom( 4 ).save( "./tmp/egirl_hair@4x.png" )
sun_glasses.zoom( 4 ).save( "./tmp/sun_glasses@4x.png" )
jack_o_lantern.zoom( 4 ).save( "./tmp/jack_o_lantern@4x.png" )


####
#  try generate
##    note:  for best merging / composing use the order:

##  1) Background
##  2) Race
##  3) Face
##  4) Mouth
##  5) Nose
##  6) Eyes
##  7) Ear Accessory
##  8) Face Accessory
##  9) Mask
## 10) Head Below
## 11) Eye Accessory
## 12) Head Above
## 13) Mouth Accessory


### try some (blade runner sci-fi) cyberpunks

###
#  Cyberpunk No. 1
punk  = Cyberpunk::Image.generate( 'Codelines',
                                   'Human 6',
                                   'Goatee Black',
                                   'Idle',
                                   'Upturned Septum Piercing',
                                   'Masc Idle',
                                   'Beanie',
                                   'Cig' )

punk.save( "tmp/punk1.png")
punk.zoom(4).save( "tmp/punk1@4x.png" )

## let's change the background
punk  = Cyberpunk::Image.generate( 'Human 6',
                                   'Goatee Black',
                                   'Idle',
                                   'Upturned Septum Piercing',
                                   'Masc Idle',
                                   'Beanie',
                                   'Cig',
                                   background: '#638596' )

punk.save( "tmp/punk1b.png")
punk.zoom(4).save( "tmp/punk1b@4x.png" )


###
#  Cyberpunk No. 2
punk  = Cyberpunk::Image.generate( 'Pink Diag',
                                   'Bot',
                                   'Lipstick Black',
                                   'Bot Nose 3',
                                   'Femme Star Liner',
                                   'Large Hoop Earrings',
                                   'Chainspace Deck Elite I',
                                   'Long Pink Pigtails' )
punk.save( "tmp/punk2.png")
punk.zoom(4).save( "tmp/punk2@4x.png" )


## let's change the background
punk  = Cyberpunk::Image.generate(  'Bot',
                                    'Lipstick Black',
                                    'Bot Nose 3',
                                    'Femme Star Liner',
                                    'Large Hoop Earrings',
                                    'Chainspace Deck Elite I',
                                    'Long Pink Pigtails',
                                    background: '#638596' )
punk.save( "tmp/punk2b.png")
punk.zoom(4).save( "tmp/punk2b@4x.png" )


###
#  Cyberpunk No. 3
punk  = Cyberpunk::Image.generate( 'Orange Tie Dye',
 'Human 9',
  'Smile',
  'Delicate',
  'Femme Wide',
  'Large Hoop Earrings',
   'Messy Bun')
punk.save( "tmp/punk3.png")
punk.zoom(4).save( "tmp/punk3@4x.png" )


punk  = Cyberpunk::Image.generate(  'Human 9',
'Smile',
'Delicate',
'Femme Wide',
'Large Hoop Earrings',
 'Messy Bun',
  background: '#638596' )
punk.save( "tmp/punk3b.png")
punk.zoom(4).save( "tmp/punk3b@4x.png" )


###
#  Cyberpunk No. 4
punk  = Cyberpunk::Image.generate( 'Metropolis 2',
                                    'Skull Blue',
  'Skull Red Dot',
   'Hood',
  'Dom Rose' )
punk.save( "tmp/punk4.png")
punk.zoom(4).save( "tmp/punk4@4x.png" )


punk  = Cyberpunk::Image.generate( 'Skull Blue',
  'Skull Red Dot',
   'Hood',
  'Dom Rose',
  background: '#638596' )
punk.save( "tmp/punk4b.png")
punk.zoom(4).save( "tmp/punk4b@4x.png" )




puts "bye"
