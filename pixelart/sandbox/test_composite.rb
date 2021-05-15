###
#  to run use
#     ruby -I ./lib sandbox/test_composite.rb


require 'pixelart/base'


composite = Pixelart::ImageComposite.new

composite << Pixelart::Image.new( 24, 24, 0xff0000ff )
composite << Pixelart::Image.new( 24, 24, 0x00ff00ff )
composite << Pixelart::Image.new( 24, 24, 0x0000ffff )
composite << Pixelart::Image.new( 24, 24, 0xffffffff )

puts composite[0,0]
puts composite[32,0]

composite[0].save( "./tmp/tile0.png" )
composite[3].save( "./tmp/tile3.png" )


composite.save( "./tmp/composite3x3.png" )
composite.grayscale.save( "./tmp/composite3x3_bn.png" )
composite.zoom(3).save( "./tmp/composite3x3x3.png")


composite = Pixelart::ImageComposite.new( 6, 4, width: 32, height: 32 )

composite << Pixelart::Image.new( 32, 32, 0xff0000ff )
composite << Pixelart::Image.new( 32, 32, 0x00ff00ff )
composite << Pixelart::Image.new( 32, 32, 0x0000ffff )

composite.save( "./tmp/composite6x4.png" )


puts "bye"
