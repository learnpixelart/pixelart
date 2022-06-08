###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'backgrounds'


rainbow1 = Pixelart::Image.read( './sandbox/i/rainbow1-24x24.png' )
rainbow2 = Pixelart::Image.read( './sandbox/i/rainbow2-24x24.png' )


backgrounds = [
  ['0xff0000'],    ## red
  ['ukraine'],
  ['pride'],
  ['0x0000ff', rainbow1],
  ['ukraine', rainbow2],
]

backgrounds.each_with_index do |values, i|
  bg = Background::Image.generate( *values, width: 24, height: 24 )
  bg.save( "./tmp/bg#{i}.png" )
  bg.zoom(4).save( "./tmp/bg#{i}@4x.png" )

  bg = Pixelart::Image.new( 24, 24 ).background( *values )
  bg.save( "./tmp/bg#{i}b.png" )
  bg.zoom(4).save( "./tmp/bg#{i}b@4x.png" )
end


puts "bye"