###
#  to run use
#     ruby -I ./lib sandbox/test_pack.rb


require 'spritesheet/base'


attributes_path  =  './sandbox/spritesheet/attributes.csv'
image_dir        =  './sandbox/spritesheet/i'


sheet = Pixelart::Spritesheet.pack( attributes_path,
                                      dir: image_dir,
                                      width: 24,
                                      height: 24 )

pp sheet.records
puts "  #{sheet.records.size} record(s)"


sheet.export( "./tmp/spritesheet_pack.csv" )

sheet.image.save( "./tmp/spritesheet_pack.png" )
sheet.image.zoom(4).save( "./tmp/spritesheet_pack@4x.png" )

sheet.image[0].zoom(4).save( "./tmp/sprite0_pack@4x.png" )
sheet.image[1].zoom(4).save( "./tmp/sprite1_pack@4x.png" )

will      = sheet.find_by( name: 'Will' )
galileo   = sheet.find_by( name: 'Galileo' )

will.save( "./tmp/will.png" )
will.zoom(4).save( "./tmp/will@4x.png" )

galileo.save( "./tmp/galileo.png" )
galileo.zoom(4).save( "./tmp/galileo@4x.png" )


puts "bye"
