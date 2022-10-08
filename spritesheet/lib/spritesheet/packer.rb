
module Pixelart


class Spritesheet

def self.pack( path,
                 cols: 10,
                 dir: '.',
                 width: 24,
                 height: 24 )

  ## check - change dir to image_dir or such - why? why not?

  attributes = CsvHash.read( path )
  puts "  #{attributes.size} record(s)"  #=> ??


  total = attributes.size

  rows = total/cols
  rows += 1  if (total % cols) != 0     ## add extra row for remainder

  sheet = ImageComposite.new( cols, rows,
                                width: width,
                                height: height )

  meta = []  ## output meta(data) records

  ####
  #  add attributes
  attributes.each do |rec|
    img_path = rec['path']
    sheet << Image.read( "#{dir}/#{img_path}" )

    name       = rec['name']
    more_names = (rec['more_names'] || '').split( '|' )

    if name.nil? || name.empty?
       name = File.basename( img_path, File.extname( img_path ))
    end

    ## normalize spaces in more names
    names = [name] + more_names
    names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}


    meta << { 'id'         => meta.size.to_s,   ## note: always strings expected (NOT integer numbers)
              'category'   => rec['type'] || rec['category'],
              'name'       => names[0],
              'more_names' => names[1..-1].join( ' | ')}

  end

   ## pp meta
   ## puts "  #{meta.size} record(s)"

  new( sheet, _build_recs( meta ),
        width: width,
        height: height )
end   # method self.pack


def export( path='./spritesheet.csv', format: 'csv' )
  if format.downcase.to_s == 'csv'
    headers = ['id', 'category', 'name', 'more_names']

    ## todo/fix: make sure dirname path exists!!!
    File.open( path, "w:utf-8" ) do |f|
       f.write( headers.join( ', '))
       f.write( "\n")
       records.each do |rec|
         values = [rec.id,
                   rec.type,
                   rec.name,
                   rec.more_names.join( ' | ')]
         f.write( values.join( ', ' ))
         f.write( "\n" )
       end
    end
  else
    puts "!! ERROR - unsupported export format >#{format}<; sorry"
    exit 1
  end
end

end # class Spritesheet
end # module Pixelart

