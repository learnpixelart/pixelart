$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart'



def pixelate( type:, parts: )
  parts.each do |rec|
    name = rec[0].downcase
    nums = rec[1]
    nums.each do |num|
       path = "./img/#{type}/#{name}#{num}.png"
       puts "==> reading >#{path}<..."
       img = Image.read( path )

       pix = Pixelator.new( img, 20, 20 )

       if pix.can_pixelate?
         puts " YES - can auto-pixelate / minify image "
       else
         puts " !! ERROR - pixelate failed with 50% threshold, trying 20%..."
         ## try again with
         if pix.can_pixelate?( threshold: 20 )
         else
           puts "!! ERROR - pixelate failed again with 20% threshold"
           exit 1
         end
       end

       outname = name
       outname = 'hair' if name == 'head'
       pix.grid.save( "./o/#{type}/#{outname}#{num}-grid.png" )
       pix.pixelate.save( "./o/#{type}/#{outname}/#{outname}#{num}.png" )
     end
  end
end




female_parts = [
  ['Head',    (1..33).to_a ],
  ['Eye',     (1..53).to_a ],
  ['Mouth',   (1..17).to_a ],
  ['Clothes', (1..59).to_a ],
]

male_parts = [
  ['Hair',    (1..36).to_a ],
  ['Eye',     (1..32).to_a ],
  ['Mouth',   (1..26).to_a ],
  ['Clothes', (1..65).to_a ],
]


pixelate( type: 'male',   parts: male_parts )
pixelate( type: 'female', parts: female_parts )


puts "bye"

