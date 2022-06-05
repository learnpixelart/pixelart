###
#  to run use
#     ruby -I ./lib sandbox/generate.rb


require 'belles'


### try some beau & belle heads (24x24)

head = Beau::Image.generate( 'Head 1', 'Shades Large Dark', 'Earring',
                      'Beanie Yellow', 'Pout 1', 'Turtleneck Rust' )
head.save( "tmp/head1.png")
head.zoom(4).save( "tmp/head1@4x.png" )


head = Beau::Image.generate( 'Head 2', 'Staring Brown', 'Side Parting Golden',
                'Snap Back Pink', 'Idle 2', 'Cigarette', 'Tank Top')
head.save( "tmp/head2.png")
head.zoom(4).save( "tmp/head2@4x.png" )


head = Belle::Image.generate( 'Head 2B', 'Big Staring Brown', 'Black Lipstick',
                'Turtleneck Rust', 'Suspenders', 'Elvish Black', 'Beret Rust' )
head.save( "tmp/head3.png")
head.zoom(4).save( "tmp/head3@4x.png" )
head.zoom(8).save( "tmp/head3@8x.png" )


head = Belle::Image.generate( 'Head 2B', 'Big Staring Blue', 'Top Knot Peach',
                'Hot Lipstick', 'Earring', 'Turtleneck Army', 'Suspenders', 'Chain' )
head.save( "tmp/head4.png")
head.zoom(4).save( "tmp/head4@4x.png" )


puts "bye"
