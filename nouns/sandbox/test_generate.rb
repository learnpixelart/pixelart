###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb

require 'nouns'


###
#  try attribute lookup

body_gold                 = Noun::Sheet.find_by( name: 'Body Gold' )
txt_pi                    = Noun::Sheet.find_by( name: 'Txt Pi' )
head_weed                 = Noun::Sheet.find_by( name: 'Head Weed' )
glasses_square_black_rgb  = Noun::Sheet.find_by( name: 'Glasses Square Black RGB' )

body_gold.save( "./tmp/body_gold.png" )
txt_pi.save( "./tmp/txt_pi.png" )
head_weed.save( "./tmp/head_weed.png" )
glasses_square_black_rgb.save( "./tmp/glasses_square_black_rgb.png" )

body_gold.zoom( 4 ).save( "./tmp/body_gold@4x.png" )
txt_pi.zoom( 4 ).save( "./tmp/txt_pi@4x.png" )
head_weed.zoom( 4 ).save( "./tmp/head_weed@4x.png" )
glasses_square_black_rgb.zoom( 4 ).save( "./tmp/glasses_square_black_rgb@4x.png" )


####
#  try generate

### try some nouns
##    note:  for best merging / composing use the order:
##            1) Body
##            2) (Body) Accessory
##            3) Head
##            4) Glasses

noun = Noun::Image.generate( 'Body Grayscale 1',
                             'Checker Bigwalk Rainbow',
                             'Head Beer',
                             'Glasses Square Fullblack' )
noun.save( "tmp/noun1.png")
noun.zoom(4).save( "tmp/noun1@4x.png" )

## let's add a background
noun = Noun::Image.generate( 'Body Grayscale 1',
                             'Checker Bigwalk Rainbow',
                             'Head Beer',
                             'Glasses Square Fullblack',
                             background: '#638596' )
noun.save( "tmp/noun1b.png")
noun.zoom(4).save( "tmp/noun1b@4x.png" )


###
#  Noun No. 2
noun = Noun::Image.generate( 'Body Red',
                             'Txt LOL',
                             'Head Weed',
                             'Glasses Square Black RGB' )
noun.save( "tmp/noun2.png")
noun.zoom(4).save( "tmp/noun2@4x.png" )


###
#  Noun No. 3

noun = Noun::Image.generate( 'Body Gold',
                             'Chain Logo',
                             'Head Ape',
                             'Glasses Square Teal' )
noun.save( "tmp/noun3.png")
noun.zoom(4).save( "tmp/noun3@4x.png" )


###
#  Noun No. 4

noun = Noun::Image.generate( 'Body Green',
                             'Dollar Bling',
                             'Head Bear',
                             'Glasses Square Blue' )
noun.save( "tmp/noun4.png")
noun.zoom(4).save( "tmp/noun4@4x.png" )


###
#  Noun No. 5

noun = Noun::Image.generate( 'Body Gradient Pride',
                             'Bling Love',
                             'Head Bubblegum',
                             'Glasses Square Yellow Saturated' )
noun.save( "tmp/noun5.png")
noun.zoom(4).save( "tmp/noun5@4x.png" )


puts "bye"
