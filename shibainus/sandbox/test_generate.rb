###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'shibainus'


###
#  try attribute lookup

classic         = Shiba::Sheet.find_by( name: 'Classic' )
crazy_hair      = Shiba::Sheet.find_by( name: 'Crazy Hair' )
beanie          = Shiba::Sheet.find_by( name: 'Beanie' )
big_shades      = Shiba::Sheet.find_by( name: 'Big Shades' )

classic.save( "./tmp/classic.png" )
crazy_hair.save( "./tmp/crazy_hair.png" )
beanie.save( "./tmp/beanie.png" )
big_shades.save( "./tmp/big_shades.png" )

classic.zoom( 4 ).save( "./tmp/classic@4x.png" )
crazy_hair.zoom( 4 ).save( "./tmp/crazy_hair@4x.png" )
beanie.zoom( 4 ).save( "./tmp/beanie@4x.png" )
big_shades.zoom( 4 ).save( "./tmp/big_shades@4x.png" )


####
#  try generate some shiba inu doge
doge = Shiba::Image.generate( 'Classic', '3D Glasses' )
doge.save( "tmp/doge1.png")
doge.zoom(4).save( "tmp/doge1@4x.png" )

doge = Shiba::Image.generate( 'Dark', 'Tiara', 'Big Shades' )
doge.save( "tmp/doge2.png")
doge.zoom(4).save( "tmp/doge2@4x.png" )

doge = Shiba::Image.generate( 'Zombie', 'Crazy Hair' )
doge.save( "tmp/doge3.png")
doge.zoom(4).save( "tmp/doge3@4x.png" )

doge = Shiba::Image.generate( 'Alien', 'Headband' )
doge.save( "tmp/doge4.png")
doge.zoom(4).save( "tmp/doge4@4x.png" )



puts "bye"
