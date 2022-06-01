####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'



readymades = CsvHash.read( "./readymades.csv")
puts "  #{readymades.size} record(s)"  #=> ??


total = readymades.size

cols = 10
rows = total/10
rows += 1  if (total % 10) != 0     ## add extra row for remainder

sheet = ImageComposite.new( cols, rows )


meta = []  ## output meta(data) records



####
#  add readymades
readymades.each do |rec|
  path = rec['path']
  sheet << Image.read( "./i/#{path}" )

  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )

  ## normalize spaces in more names
  names = [name] + more_names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
           rec['category'],
           names[0],
           names[1..-1].join( ' | '),
         ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )
sheet.zoom(4).save( "./tmp/spritesheet@4x.png" )


headers = ['id', 'category', 'name', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"