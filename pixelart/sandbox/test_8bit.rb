###
#  to run use
#     ruby -I ./lib sandbox/test_8bit.rb


require 'pixelart/base'



palettes = [
  ['grayscale', Pixelart::Palette8bit::GRAYSCALE],
  ['sepia',     Pixelart::Palette8bit::SEPIA],
  ['blue',      Pixelart::Palette8bit::BLUE],
  ['false',     Pixelart::Palette8bit::FALSE],
]

palettes.each do |palette|
  puts "#{palette[0]} - #{palette[1].size} color(s):"
  pp palette[1][0..12]  ## only dump first colors

  img = Pixelart::ImagePalette8bit.new( palette[1] )
  img.save( "tmp/palette_#{palette[0]}.png" )

  img = Pixelart::ImagePalette8bit.new( palette[1], size: 4 )
  img.save( "tmp/palette_#{palette[0]}4.png" )
  img.zoom(2).save( "tmp/palette_#{palette[0]}4x2.png" )
end



puts "bye"
