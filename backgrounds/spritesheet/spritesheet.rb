####################
#  assemble spritesheet(s) (all-in-one composite image with attributes)

require 'pixelart'


sheet, meta = generate_spritesheet( './attributes-24x24.csv',
                                    dir: './i/24x24',
                                    width: 24, height: 24 )

sheet.save( "./tmp/spritesheet-24x24.png" )
sheet.zoom(2).save( "./tmp/spritesheet-24x24@2x.png" )
sheet.zoom(4).save( "./tmp/spritesheet-24x24@4x.png" )


headers = ['id', 'category', 'name', 'more_names']
File.open( "./tmp/spritesheet-24x24.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end



puts "bye"