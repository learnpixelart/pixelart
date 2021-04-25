###
#  to run use
#     ruby -I ./lib sandbox/test_led_ii.rb

require 'pixelart/base'


rootdir='../../../cryptocopycats/mooncats/led/i'


## todo/fix: change background to transparent in mooncats gem!!!!


cat = Pixelart::Image.read( "#{rootdir}/mooncat-0077c8278d.png" )
puts " #{cat.width}x#{cat.height}"

cat_led = cat.led( 8, spacing: 2 )
cat_led.save( './tmp/mooncat-0077c8278d_led8x.png' )

cat_led = cat.led( 16, spacing: 3 )
cat_led.save( './tmp/mooncat-0077c8278d_led16x.png' )

cat_led = cat.led( 16, spacing: 8, round_corner: true )
cat_led.save( './tmp/mooncat-0077c8278d_led16xr.png' )



cat = Pixelart::Image.read( "#{rootdir}/mooncat-00000800fa.png" )
puts " #{cat.width}x#{cat.height}"

cat_led = cat.led( 8, spacing: 2 )
cat_led.save( './tmp/mooncat-00000800fa_led8x.png' )

cat_led = cat.led( 16, spacing: 3 )
cat_led.save( './tmp/mooncat-00000800fa_led16x.png' )

cat_led = cat.led( 16, spacing: 8, round_corner: true )
cat_led.save( './tmp/mooncat-00000800fa_led16xr.png' )


puts "bye"


