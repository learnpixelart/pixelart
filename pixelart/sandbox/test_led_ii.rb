###
#  to run use
#     ruby -I ./lib sandbox/test_led_ii.rb

require 'pixelart/base'


rootdir='../../../cryptopunksnotdead/programming-cryptopunks/i'

color_map = {
  0xff => 0x242124ff,  # use raisin black for black; black already in use for background
}



punk = Pixelart::Image.read( "#{rootdir}/punk-3100.png" )
puts " #{punk.width}x#{punk.height}"
punk = punk.change_colors( color_map )

punk_led = punk.led( 8, spacing: 2 )
punk_led.save( './tmp/punk-3100_led8x.png' )

punk_led = punk.led( 16, spacing: 3 )
punk_led.save( './tmp/punk-3100_led16x.png' )

punk_led = punk.led( 16, spacing: 8, round_corner: true )
punk_led.save( './tmp/punk-3100_led16xr.png' )




ids = [
 3393,   ## zombie
 172,    ## female
 2964,   ## male
]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "#{rootdir}/punk-#{name}.png" )
  puts " #{punk.width}x#{punk.height}"
  punk = punk.change_colors( color_map )

  punk_led = punk.led( 8, spacing: 2 )
  punk_led.save( "./tmp/punk-#{name}_led8x.png" )

  punk_led = punk.led( 16, spacing: 3 )
  punk_led.save( "./tmp/punk-#{name}_led16x.png" )

  punk_led = punk.led( 16, spacing: 8, round_corner: true )
  punk_led.save( "./tmp/punk-#{name}_led16xr.png" )
end


puts "bye"


