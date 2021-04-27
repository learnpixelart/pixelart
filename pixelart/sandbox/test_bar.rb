###
#  to run use
#     ruby -I ./lib sandbox/test_bar.rb


require 'pixelart/base'

colors_genesis_white = ['#555555', '#d3d3d3', '#ffffff', '#aaaaaa', '#ff9999']
bar = Pixelart::ImageColorBar.new( colors_genesis_white )
bar.save( "./tmp/bar_white.png" )


colors_genesis_black = ['#555555', '#222222', '#111111', '#bbbbbb', '#ff9999']
bar = Pixelart::ImageColorBar.new( colors_genesis_black, size: 32 )
bar.save( "./tmp/bar_black.png" )



puts "bye"
