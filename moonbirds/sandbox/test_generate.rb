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

_3d_glasses.save( "./tmp/3d_glasses-42x42.png" )
beanie.save( "./tmp/beanie-42x42.png" )
chromie.save( "./tmp/chromie-42x42.png" )
mcdonalds_red.save( "./tmp/mcdonalds_red-42x42.png" )

_3d_glasses.zoom( 4 ).save( "./tmp/3d_glasses-42x42@4x.png" )
beanie.zoom( 4 ).save( "./tmp/beanie-42x42@4x.png" )
chromie.zoom( 4 ).save( "./tmp/chromie-42x42@4x.png" )
mcdonalds_red.zoom( 4 ).save( "./tmp/mcdonalds_red-42x42@4x.png" )


_3d_glasses   = Moonbirdie::Sheet.find_by( name: '3D Glasses' )
beanie        = Moonbirdie::Sheet.find_by( name: 'Beanie' )
chromie       = Moonbirdie::Sheet.find_by( name: 'Chromie' )

_3d_glasses.save( "./tmp/3d_glasses-24x24.png" )
beanie.save( "./tmp/beanie-24x24.png" )
chromie.save( "./tmp/chromie-24x24.png" )

_3d_glasses.zoom( 4 ).save( "./tmp/3d_glasses-24x24@4x.png" )
beanie.zoom( 4 ).save( "./tmp/beanie-24x24@4x.png" )
chromie.zoom( 4 ).save( "./tmp/chromie-24x24@4x.png" )



####
#  try generate

bird = Moonbird::Image.generate( "Tabby Brown", "Small Orange", "Open White" )
bird.save( "./tmp/moonbird1.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Small Orange", "Open White", "3D Glasses" )
bird.save( "./tmp/moonbird1b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1b@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Small Orange", "Open White", "McDonald's Red" )
bird.save( "./tmp/moonbird1c.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1c@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Small Orange", "Open White", "McDonald's Red", "Drive-Thru On Duty" )
bird.save( "./tmp/moonbird1d.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1d@4x.png" )

bird = Moonbird::Image.generate( "Tabby Brown", "Small Orange", "Open White", "McDonald's Red", "Drive-Thru On Duty", "McDonald's Shirt (Old Skool)" )
bird.save( "./tmp/moonbird1e.png" )
bird.zoom( 4 ).save( "./tmp/moonbird1e@4x.png" )


bird = Moonbird::Image.generate( "Professor Golden", "Small Golden", "Open Golden" )
bird.save( "./tmp/moonbird2.png" )
bird.zoom( 4 ).save( "./tmp/moonbird2@4x.png" )

bird = Moonbird::Image.generate( "Crescent Golden", "Small Golden", "Open Golden", "Beanie" )
bird.save( "./tmp/moonbird2b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird2b@4x.png" )



bird = Moonbird::Image.generate( "Brave Glitch" )
bird.save( "./tmp/moonbird3.png" )
bird.zoom( 4 ).save( "./tmp/moonbird3@4x.png" )

bird = bird.background( 'red' )
bird.save( "./tmp/moonbird3b.png" )
bird.zoom( 4 ).save( "./tmp/moonbird3b@4x.png" )

####
#  try generate lil' birdies

birdie = Moonbirdie::Image.generate( "Tabby Brown", "Small Orange", "Open White" )
birdie.save( "./tmp/moonbirdie1.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie1@4x.png" )

birdie = Moonbirdie::Image.generate( "Tabby Brown", "Small Orange", "Open White", "3D Glasses" )
birdie.save( "./tmp/moonbirdie1b.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie1b@4x.png" )


birdie = Moonbirdie::Image.generate( "Professor Golden", "Small Golden", "Open Golden" )
birdie.save( "./tmp/moonbirdie2.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie2@4x.png" )

birdie = Moonbirdie::Image.generate( "Crescent Golden", "Small Golden", "Open Golden", "Beanie" )
birdie.save( "./tmp/moonbirdie2b.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie2b@4x.png" )


birdie = Moonbirdie::Image.generate( "Ruby Skeleton", "Small Ruby", "Moon", "Lincoln" )
birdie.save( "./tmp/moonbirdie3.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie3@4x.png" )

birdie = birdie.background('ukraine')
birdie.save( "./tmp/moonbirdie3b.png" )
birdie.zoom( 4 ).save( "./tmp/moonbirdie3b@4x.png" )
birdie.zoom( 8 ).save( "./tmp/moonbirdie3b@8x.png" )


puts "bye"
