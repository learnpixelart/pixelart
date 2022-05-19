###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'coolcats'


###
#  try attribute lookup

base            = Coolcat::Sheet.find_by( name: 'Base' )
beanie_orange   = Coolcat::Sheet.find_by( name: 'Beanie Orange' )
costume_gorilla = Coolcat::Sheet.find_by( name: 'Costume Gorilla' )
overalls_blue   = Coolcat::Sheet.find_by( name: 'Overalls Blue' )

base.save( "./tmp/base.png" )
beanie_orange.save( "./tmp/beanie_orange.png" )
costume_gorilla.save( "./tmp/costume_gorilla.png" )
overalls_blue.save( "./tmp/overalls_blue.png" )

base.zoom( 4 ).save( "./tmp/base@4x.png" )
beanie_orange.zoom( 4 ).save( "./tmp/beanie_orange@4x.png" )
costume_gorilla.zoom( 4 ).save( "./tmp/costume_gorilla@4x.png" )
overalls_blue.zoom( 4 ).save( "./tmp/overalls_blue@4x.png" )


####
#  try generate

### try some coolcats
coolcat = Coolcat::Image.generate( 'Ditto', 'Beret Red' )
coolcat.save( "tmp/coolcat1.png")
coolcat.zoom(4).save( "tmp/coolcat1@4x.png" )


coolcat = Coolcat::Image.generate( 'Hearts', 'Afro Black' )
coolcat.save( "tmp/coolcat2.png")
coolcat.zoom(4).save( "tmp/coolcat2@4x.png" )


coolcat = Coolcat::Image.generate( 'Unamused' )
coolcat.save( "tmp/coolcat3.png")
coolcat.zoom(4).save( "tmp/coolcat3@4x.png" )


## try tv heads

coolcat = Coolcat::Image.generate( 'TV Head White', 'TV Face 404' )
coolcat.save( "tmp/coolcat4.png")
coolcat.zoom(4).save( "tmp/coolcat4@4x.png" )

coolcat = Coolcat::Image.generate( 'TV Head Grey',  'TV Face No Signal' )
coolcat.save( "tmp/coolcat5.png")
coolcat.zoom(4).save( "tmp/coolcat5@4x.png" )

coolcat = Coolcat::Image.generate( 'TV Head Purple', 'TV Face XP' )
coolcat.save( "tmp/coolcat6.png")
coolcat.zoom(4).save( "tmp/coolcat6@4x.png" )


## try halloween theme

coolcat = Coolcat::Image.generate( 'Jack' )
coolcat.save( "tmp/coolcat7.png")
coolcat.zoom(4).save( "tmp/coolcat7@4x.png" )

coolcat = Coolcat::Image.generate( 'Scream' )
coolcat.save( "tmp/coolcat8.png")
coolcat.zoom(4).save( "tmp/coolcat8@4x.png" )

coolcat = Coolcat::Image.generate( 'Beret Red', 'Skull' )
coolcat.save( "tmp/coolcat9.png")
coolcat.zoom(4).save( "tmp/coolcat9@4x.png" )


puts "bye"
