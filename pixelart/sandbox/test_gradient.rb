###
#  to run use
#     ruby -I ./lib sandbox/test_gradient.rb


require 'pixelart/base'


####################
# https://uigradients.com/#Instagram

uigradients = {
  'instagram'       => ['833ab4',
                        'fd1d1d', 'fcb045'],
  'flare'           => ['f12711', 'f5af19'],
  'terminal'        => ['000000', '0f9b0f'],
  'the_blue_lagoon' => ['43c6ac', '191654'],
  'ibiza_sunset'    => ['ee0979', 'ff6a00'],
  'superman'        => ['0099f7', 'f11712'],
  'christmas'       => ['2f7336', 'aa3a38'],
  'dark_knight'     => ['ba8b02', '181818'],
  'ukraine'         => ['004ff9', 'fff94c'],
}



uigradients.each do |name, stops|
  puts
  puts "==> #{name}:"
  gradient = Pixelart::Gradient.new( *stops )
  colors = gradient.colors( 256 )
  pp colors.map { |color| Pixelart::Color.format( color ) }

  img = Pixelart::ImagePalette8bit.new( colors, size: 4 )
  img.save( "tmp/palette_#{name}4.png" )
  img.zoom(2).save( "tmp/palette_#{name}4x2.png" )
end

puts "bye"
