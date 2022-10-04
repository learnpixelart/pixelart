####################
#  assemble spritesheet(s) (all-in-one composite image with attributes)

require 'spritesheet'


## note: smiley circle variants with different diameters in 24px canvas
##   e.g. diameters of 15px, 16px, 17px, 20px

diameters = [15,16]


diameters.each do |diameter|
   sheet = Spritesheet.pack( "./attributes_dia#{diameter}.csv",
                              dir: "./attributes/dia#{diameter}",
                              width: 24, height: 24 )

  sheet.image.save( "./tmp/spritesheet_dia#{diameter}-24x24.png" )
  sheet.image.zoom(2).save( "./tmp/spritesheet_dia#{diameter}-24x24@2x.png" )
  sheet.image.zoom(4).save( "./tmp/spritesheet_dia#{diameter}-24x24@4x.png" )

  sheet.export( "./tmp/spritesheet_dia#{diameter}-24x24.csv" )
end


puts "bye"