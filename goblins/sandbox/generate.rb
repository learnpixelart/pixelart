###
#  to run use
#     ruby -I ./lib sandbox/generate.rb


require 'goblins'


### try some goblins (24x24)

goblin  = Goblin::Image.generate( 'Green', 'Teeth',
                                   '3D Glasses', 'Blue Sweater' )
goblin.save( "tmp/goblin1.png")
goblin.zoom(4).save( "tmp/goblin1@4x.png" )
goblin.zoom(8).save( "tmp/goblin1@8x.png" )


goblin  = Goblin::Image.generate( 'Gold 2', 'Eyes', 'Frown', 'Horns', 'Suit Open' )
goblin.save( "tmp/goblin2.png")
goblin.zoom(4).save( "tmp/goblin2@4x.png" )
goblin.zoom(8).save( "tmp/goblin2@8x.png" )


goblin  = Goblin::Image.generate( 'Blue', 'Eyes', 'Smile', 'Hoodie', 'Bow', 'Bojangles' )
goblin.save( "tmp/goblin3.png")
goblin.zoom(4).save( "tmp/goblin3@4x.png" )
goblin.zoom(8).save( "tmp/goblin3@8x.png" )



### try some lil'goblins (20x20)

lilgoblin  = LilGoblin::Image.generate( 'Green', 'Orange Beanie', 'Earring Silver', 'Blue Sweater' )
lilgoblin.save( "tmp/lilgoblin1.png")
lilgoblin.zoom(4).save( "tmp/lilgoblin1@4x.png" )


lilgoblin  = LilGoblin::Image.generate( 'Gold', 'Cool Shades', 'Horns', 'Suit Open' )
lilgoblin.save( "tmp/lilgoblin2.png")
lilgoblin.zoom(4).save( "tmp/lilgoblin2@4x.png" )

lilgoblin  = LilGoblin::Image.generate( 'Red', 'Chef', 'Orange Shades', 'Hoodie', 'Earring Gold' )
lilgoblin.save( "tmp/lilgoblin3.png")
lilgoblin.zoom(4).save( "tmp/lilgoblin3@4x.png" )
lilgoblin.zoom(8).save( "tmp/lilgoblin3@8x.png" )


puts "bye"
