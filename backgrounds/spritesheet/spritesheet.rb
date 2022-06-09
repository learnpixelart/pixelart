####################
#  assemble spritesheet(s) (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( './attributes-24x24.csv',
                           dir: './i/24x24',
                           width: 24, height: 24 )

sheet.image.save( "./tmp/spritesheet-24x24.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet-24x24@2x.png" )
sheet.image.zoom(4).save( "./tmp/spritesheet-24x24@4x.png" )

sheet.export( "./tmp/spritesheet-24x24.csv" )


puts "bye"