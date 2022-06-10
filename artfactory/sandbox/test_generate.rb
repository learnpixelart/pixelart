###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'artfactory/base'



#################
#  setup variant 1

shiba1 = Artfactory.read( './sandbox/config/spritesheet.png',
                          './sandbox/config/spritesheet.csv',
                          width: 24,
                          height: 24)

doge = shiba1.generate( 'Classic', '3D Glasses' )
doge.save( './tmp/doge1.png' )
doge.zoom(4).save( './tmp/doge1@4x.png' )


doge = shiba1.generate( 'Alien', 'Headband' )
doge.save( './tmp/doge2.png' )
doge.zoom(4).save( './tmp/doge2@4x.png' )

doge = doge.background( 'Matrix 1', 'Rainbow 1' )
doge.save( './tmp/doge2b.png' )
doge.zoom(4).save( './tmp/doge2b@4x.png' )



#################
#  setup variant 2

sheet = Pixelart::Spritesheet.read( './sandbox/config/spritesheet.png',
                                    './sandbox/config/spritesheet.csv',
                                      width: 24,
                                      height: 24)
shiba2 =  Artfactory.use( sheet )

doge = shiba2.generate( 'Classic', '3D Glasses' )
doge.save( './tmp/doge1-ii.png' )
doge.zoom(4).save( './tmp/doge1-ii@4x.png' )


doge = shiba2.generate( 'Alien', 'Headband' )
doge.save( './tmp/doge2-ii.png' )
doge.zoom(4).save( './tmp/doge2-ii@4x.png' )

doge = doge.background( 'Matrix 1', 'Rainbow 1' )
doge.save( './tmp/doge2b-ii.png' )
doge.zoom(4).save( './tmp/doge2b-ii@4x.png' )


puts "bye"