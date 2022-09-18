###
#  to run use
#     ruby -I ./lib sandbox/test_generate_v1.rb


require 'moonbirds'


###
#  try attribute lookup

_3d_glasses   = Moonbird::Sheet.find_by( name: '3D Glasses' )
beanie        = Moonbird::Sheet.find_by( name: 'Beanie' )
chromie       = Moonbird::Sheet.find_by( name: 'Chromie' )

_3d_glasses.save( "./tmp/v1/3d_glasses-42x42.png" )
beanie.save( "./tmp/v1/beanie-42x42.png" )
chromie.save( "./tmp/v1/chromie-42x42.png" )

_3d_glasses.zoom( 4 ).save( "./tmp/v1/3d_glasses-42x42@4x.png" )
beanie.zoom( 4 ).save( "./tmp/v1/beanie-42x42@4x.png" )
chromie.zoom( 4 ).save( "./tmp/v1/chromie-42x42@4x.png" )



####
#  try generate

bird = MoonbirdV1::Image.generate( "Tabby Brown", "Small Orange", "Open White" )
bird.save( "./tmp/v1/moonbird1.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird1@4x.png" )

bird = MoonbirdV1::Image.generate( "Tabby Brown", "Small Orange", "Open White", "3D Glasses" )
bird.save( "./tmp/v1/moonbird1b.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird1b@4x.png" )


bird = MoonbirdV1::Image.generate( "Golden Legendary Professor", "Small Golden", "Open Golden" )
bird.save( "./tmp/v1/moonbird2.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird2@4x.png" )

bird = MoonbirdV1::Image.generate( "Golden Legendary Crescent", "Small Golden", "Open Golden", "Beanie" )
bird.save( "./tmp/v1/moonbird2b.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird2b@4x.png" )



bird = MoonbirdV1::Image.generate( "Glitch Legendary Brave", "Glitch 6" )
bird.save( "./tmp/v1/moonbird3.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird3@4x.png" )

bird = bird.background( 'red' )
bird.save( "./tmp/v1/moonbird3b.png" )
bird.zoom( 4 ).save( "./tmp/v1/moonbird3b@4x.png" )



puts "bye"
