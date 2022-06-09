###
#  to run use
#     ruby -I ./lib sandbox/test_read.rb


require 'spritesheet/base'



image_path =  './sandbox/config/spritesheet.png'
meta_path  =  './sandbox/config/spritesheet.csv'

pp recs = Pixelart::Spritesheet.read_records( meta_path )
puts "  #{recs.size} record(s)"
pp recs = Pixelart::Spritesheet.read_meta( meta_path )
puts "  #{recs.size} record(s)"


sheet = Pixelart::Spritesheet.read( image_path,
                                    meta_path,
                                    width: 24,
                                    height: 24 )


pp sheet.records
puts "  #{sheet.records.size} record(s)"
pp sheet.meta
puts "  #{sheet.meta.size} record(s)"


sheet.image.save( "./tmp/spritesheet.png" )

sheet.image[0].zoom(4).save( "./tmp/sprite0@4x.png" )
sheet.image[1].zoom(4).save( "./tmp/sprite1@4x.png" )

classic = sheet.find_by( name: 'Classic' )
alien   = sheet.find_by( name: 'Alien' )

classic.save( "./tmp/classic.png" )
classic.zoom(4).save( "./tmp/classic@4x.png" )

alien.save( "./tmp/alien.png" )
alien.zoom(4).save( "./tmp/alien@4x.png" )


classic = sheet[ 'Classic' ]
alien   = sheet[ 'Alien' ]

classic.save( "./tmp/classic-ii.png" )
classic.zoom(4).save( "./tmp/classic-ii@4x.png" )

alien.save( "./tmp/alien-ii.png" )
alien.zoom(4).save( "./tmp/alien-ii@4x.png" )


puts "bye"