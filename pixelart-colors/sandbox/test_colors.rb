###
#  to run use
#     ruby -I ./lib sandbox/test_colors.rb


require 'pixelart/colors/base'

colors = {'transparent' => Pixelart::Color::TRANSPARENT,
          'black' => Pixelart::Color::BLACK,
          'white' => Pixelart::Color::WHITE,
          'red'    =>  0xff0000ff,
          'yellow' =>  0xffff00ff,   # r(ed) + g(reen) = yellow
         }


colors.each do |name,color|
  puts "==> #{name} - #{color}"
  print "  transparent? "; pp Pixelart::Color.transparent?( color )
  print "  opaque? "; pp Pixelart::Color.opaque?( color )

  print "  to_hex: "; pp Pixelart::Color.to_hex( color )
  print "  to_hsl: "; pp Pixelart::Color.to_hsl( color )
  print "  to_hsv: "; pp Pixelart::Color.to_hsv( color )
  print "  "; puts Pixelart::Color.format( color )
end


puts "bye"
