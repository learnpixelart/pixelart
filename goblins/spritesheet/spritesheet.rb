####################
#  assemble spritesheet(s) (all-in-one composite image with attributes)

require 'pixelart'



attributes = CsvHash.read( "./attributes-24x24.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = attributes.size

cols = 10
rows = total/10
rows += 1  if (total % 10) != 0     ## add extra row for remainder

sheet = ImageComposite.new( cols, rows )


meta = []  ## output meta(data) records


####
#  add readymades
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./i/24x24/#{path}" )

  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )

  if name.nil? || name.empty?
      name = File.basename( path, File.extname( path ))
  end


  ## normalize spaces in more names
  names = [name] + more_names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
           rec['category'],
           names[0],
           names[1..-1].join( ' | '),
         ]
end



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