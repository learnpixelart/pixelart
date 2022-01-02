###
#  to run use
#     ruby -I ./lib sandbox/test_double.rb

$LOAD_PATH.unshift( "../pixelart/lib" )
require 'popart'


frida = Image.read( 'i/frida_kahlo-24x24.png')


popart = frida.double( background: '#ffff00' )  # try yellow background
popart.save( 'tmp/frida-double.png' )
popart.zoom(2).save( 'tmp/frida-double@2x.png' )
popart.zoom(4).save( 'tmp/frida-double@4x.png' )
popart.zoom(8).save( 'tmp/frida-double@8x.png' )

popart = frida.triple( background: '#ffff00' )
popart.save( 'tmp/frida-triple.png' )

popart = frida.twohundred( background: '#ffff00' )
popart.save( 'tmp/frida-twohundred.png' )

popart = frida.twohundredten( background: '#ffff00' )
popart.save( 'tmp/frida-twohundredten.png' )

popart = frida.thirty( background: '#ffff00' )
popart.save( 'tmp/frida-thirty.png' )

popart = frida.fortytwo( background: '#ffff00' )
popart.save( 'tmp/frida-fortytwo.png' )
popart.zoom(2).save( 'tmp/frida-fortytwo@2x.png' )



puts "bye"