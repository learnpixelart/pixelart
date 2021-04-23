###
#  to run use
#     ruby -I ./lib sandbox/test_pixelator.rb


require 'pixelart/base'



img = Pixelart::Image.read( './i/billie-eilish-xl.png' )

pix = Pixelart::Pixelator.new( img, 24, 24 )

pix_grid = pix.grid( spacing: 10 )
pix_grid.save( './tmp/billie-eilish-grid.png' )

pp pix.can_pixelate?

pix_24x24 = pix.pixelate
pix_24x24.save( './tmp/billie-eilish-24x24.png' )



pp pix.pixels[0..4]
puts "---"
pp pix[0,0]
pp pix[0,1]
pp pix[1,0]


puts "bye"

