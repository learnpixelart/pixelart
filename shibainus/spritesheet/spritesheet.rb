####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( "./attributes.csv",
                          dir: "../../../punks.blocks/doge",
                          cols: 4,
                          width: 24,
                          height: 24 )

sheet.image.save( "./tmp/spritesheet.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet@2x.png" )
sheet.image.zoom(4).save( "./tmp/spritesheet@4x.png" )

sheet.export( "./tmp/spritesheet.csv" )


puts "bye"
