###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'moonbirds'


###
#  try attribute lookup

_3d_glasses   = Moonbird::Sheet.find_by( name: '3D Glasses' )
beanie        = Moonbird::Sheet.find_by( name: 'Beanie' )
chromie       = Moonbird::Sheet.find_by( name: 'Chromie' )

mcdonalds_red = Moonbird::Sheet.find_by( name: "McDonald's Red" )


_3d_glasses.zoom( 4 ).save( "./tmp/3d_glasses@4x.png" )
beanie.zoom( 4 ).save( "./tmp/beanie@4x.png" )
chromie.zoom( 4 ).save( "./tmp/chromie@4x.png" )

mcdonalds_red.zoom( 4 ).save( "./tmp/mcdonalds_red@4x.png" )



####
#  try generate

bird = Moonbird::Image.generate( "Tabby Brown", "Beak Small Orange", "Eyes Open White" )
bird.save( "./tmp/moonbird1.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Beak Small Orange", "Eyes Open White", "3D Glasses" )
bird.save( "./tmp/moonbird1b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1b@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Beak Small Orange", "Eyes Open White", "McDonald's Red" )
bird.save( "./tmp/moonbird1c.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1c@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Beak Small Orange", "Eyes Open White", "McDonald's Red", "Drive-Thru On Duty" )
bird.save( "./tmp/moonbird1d.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1d@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Beak Small Orange", "Eyes Open White", "McDonald's Red", "Drive-Thru On Duty", "McDonald's Shirt (Old Skool)" )
bird.save( "./tmp/moonbird1e.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1e@4x.png" )


bird = Moonbird::Image.generate( "Professor Golden", "Beak Small Golden", "Eyes Open Golden" )
bird.save( "./tmp/moonbird2.png" )
bird.zoom( 4 ).save( "./tmp/moonbird2@4x.png" )

bird = Moonbird::Image.generate( "Crescent Golden", "Beak Small Golden", "Eyes Open Golden", "Beanie" )
bird.save( "./tmp/moonbird2b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird2b@4x.png" )



bird = Moonbird::Image.generate( "Brave Glitch" )
bird.save( "./tmp/moonbird3.png" )
bird.zoom( 4 ).save( "./tmp/moonbird3@4x.png" )

bird = Moonbird::Image.generate( "Brave Glitch", background: 'red' )
bird.save( "./tmp/moonbird3b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird3b@4x.png" )

puts "bye"
