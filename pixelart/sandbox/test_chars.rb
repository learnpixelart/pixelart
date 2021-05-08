###
#  to run use
#     ruby -I ./lib sandbox/test_chars.rb


require 'pixelart/base'

## color map  - genesis white
colors = [
  '#555555',   # color 1
  '#d3d3d3',   # color 2
  '#ffffff',   # color 3
  '#aaaaaa',   # color 4
  '#ff9999'    # color 5
]

pixels =<<PIXELS
###
# mooncat design: 3 - Stalking Smiling Pure Left; size: 20x21

. . . . . . . . . . @ @ @ @ @ @ . . . .
. . . . . . . . . . @ o o o o @ @ @ . .
. . . . . . . . . . @ o @ @ o o o @ . .
. . . . . . . . . . @ @ . . @ @ o @ . .
. . . . . . . . . . . . . . . @ o @ @ .
. . . . . . . . . . . . . . . @ o o @ .
. . @ @ . . . . @ @ . . . @ @ @ @ @ @ .
. @ o @ . . . @ o @ . . @ @ o o o o @ @
@ o ~ o @ @ @ o ~ o @ @ @ o o o o o o @
@ o o o o o o o o o @ @ o o o o o o o @
@ o o o o o o o o o @ o o o o o o o o @
@ o o @ o o o @ o o @ o o o o o o o @ @
@ o o o o o o o o o @ o o o o o o o @ .
@ o o ^ o ~ o ^ o o @ o o o o ^ o o @ .
@ o o o ^ o ^ o o o @ o o ^ ^ ^ o o @ .
. @ o o o o o o o @ @ o ^ ^ ^ @ o o o @
. . @ @ @ @ @ @ @ o o o @ @ @ @ @ o o @
. @ @ o o o o o o o @ @ @ o o @ @ o @ @
@ @ o o o @ o o @ @ @ @ ~ o @ @ o o @ .
@ ~ o @ @ @ ~ @ @ . . @ @ @ @ ~ o @ @ .
@ @ @ @ . @ @ @ . . . . . . @ @ @ @ . .
PIXELS


img = Pixelart::Image.parse( pixels, colors: colors )
img.save( './tmp/mooncat_white_chars.png' )

img3x = img.zoom( 3 )
img3x.save( './tmp/mooncat_white_chars-3x.png' )


puts
puts "#{Pixelart::Image::CHARS.size} char(s):"
puts Pixelart::Image::CHARS

puts "bye"