###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'smileys'



####
#  try generate

smiley  = Smiley16::Image.generate( "Yellow", "Face 1" )
smiley.save( "./tmp/smiley1.png" )
smiley.zoom( 4 ).save( "./tmp/smiley1@4x.png" )

base = smiley

smiley = base.background( 'ukraine' )
smiley.save( "./tmp/smiley1.1.png" )
smiley.zoom( 4 ).save( "./tmp/smiley1.1@4x.png" )

smiley = base.background( 'rainbow' )
smiley.save( "./tmp/smiley1.2.png" )
smiley.zoom( 4 ).save( "./tmp/smiley1.2@4x.png" )


# no - no outline variant
smiley  = Smiley16::Image.generate( "Yellow.No", "Face 1" )
smiley.save( "./tmp/smiley1b.png" )
smiley.zoom( 4 ).save( "./tmp/smiley1b@4x.png" )

# (re)try with eyes + mouth
smiley  = Smiley16::Image.generate( "Yellow", "Open", "Smile" )
smiley.save( "./tmp/smiley1c.png" )
smiley.zoom( 4 ).save( "./tmp/smiley1c@4x.png" )





smiley = Smiley16::Image.generate( "Greener", "Face 2" )
smiley.save( "./tmp/smiley2.png" )
smiley.zoom( 4 ).save( "./tmp/smiley2@4x.png" )

smiley = Smiley16::Image.generate( "Greener.No", "Face 2" )
smiley.save( "./tmp/smiley2b.png" )
smiley.zoom( 4 ).save( "./tmp/smiley2b@4x.png" )

# (re)try with eyes + mouth
smiley  = Smiley16::Image.generate( "Greener", "Shades", "Grin (Right)" )
smiley.save( "./tmp/smiley2c.png" )
smiley.zoom( 4 ).save( "./tmp/smiley2c@4x.png" )


puts "bye"

