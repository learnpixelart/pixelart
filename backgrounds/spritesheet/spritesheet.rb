####################
#  assemble spritesheet(s) (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( './backgrounds-24x24.csv',
                           dir: './i/24x24',
                           width: 24, height: 24 )

sheet.image.save( "./tmp/spritesheet-24x24.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet-24x24@2x.png" )
sheet.image.zoom(4).save( "./tmp/spritesheet-24x24@4x.png" )

sheet.export( "./tmp/spritesheet-24x24.csv" )



sheet = Spritesheet.pack( './backgrounds-32x32.csv',
                           dir: './i/32x32',
                           width: 32, height: 32 )

sheet.image.save( "./tmp/spritesheet-32x32.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet-32x32@2x.png" )
sheet.image.zoom(4).save( "./tmp/spritesheet-32x32@4x.png" )

sheet.export( "./tmp/spritesheet-32x32.csv" )


puts "bye"