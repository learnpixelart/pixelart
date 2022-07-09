###
#  to run use
#     ruby -I ./lib sandbox/test_gradient.rb


require 'pixelart/colors/base'


gradient = Pixelart::Gradient.new( '000000', 'ffffff' )
# gradient = Pixelart::Gradient.new(  'ffffff', '000000' )

pp colors = gradient.colors( 256 )   ## 256 steps
puts "---"
pp colors.map { |color| Pixelart::Color.format( color ) }

puts
puts "---"
pp colors = gradient.colors( 10 )    ## 10 steps
puts "---"
pp colors.map { |color| Pixelart::Color.format( color ) }



gradient = Pixelart::Gradient.new( '000000',
                                   '050505',
                                   '0a0a0a', '0e0e0e'
                                  )
puts
puts "---"
pp colors = gradient.colors( 15 )   ## 15 steps (3x5)
puts "---"
pp colors.map { |color| Pixelart::Color.format( color ) }



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
end

puts "bye"
