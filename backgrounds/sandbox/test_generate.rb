###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb


require 'backgrounds/base'


rainbow1 = Pixelart::Image.read( './sandbox/i/rainbow1-24x24.png' )
rainbow2 = Pixelart::Image.read( './sandbox/i/rainbow2-24x24.png' )


backgrounds_24x24 = [
  ['0xff0000'],    ## red
  ['Ukraine'],
  ['Stand With Ukraine'],
  ['Pride'],
  ['0x0000ff', rainbow1],
  ['Ukraine', rainbow2],
  ['0x0000ff', 'Rainbow 1'],
  ['Ukraine', 'Rainbow 2'],
  ['Matrix 1'],
  ['Matrix 2', 'Rainbow 1'],
]

backgrounds_24x24.each_with_index do |values, i|
  bg = Pixelart::Background::Image.generate( *values, width: 24, height: 24 )
  bg.save( "./tmp/bg#{i}-24x24.png" )
  bg.zoom(4).save( "./tmp/bg#{i}-24x24@4x.png" )

  bg = Pixelart::Image.new( 24, 24 ).background( *values )
  bg.save( "./tmp/bg#{i}b-24x24.png" )
  bg.zoom(4).save( "./tmp/bg#{i}b-24x24@4x.png" )
end



backgrounds_32x32 = [
  ['0xff0000'],    ## red
  ['Save Ukraine'],
  ['Metropolis 1'],
  ['Codelines'],
]

backgrounds_32x32.each_with_index do |values, i|
  bg = Pixelart::Background::Image.generate( *values, width: 32, height: 32 )
  bg.save( "./tmp/bg#{i}-32x32.png" )
  bg.zoom(4).save( "./tmp/bg#{i}-32x32@4x.png" )

  bg = Pixelart::Image.new( 32, 32 ).background( *values )
  bg.save( "./tmp/bg#{i}b-32x32.png" )
  bg.zoom(4).save( "./tmp/bg#{i}b-32x32@4x.png" )
end



puts "bye"