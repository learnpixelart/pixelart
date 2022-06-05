# Goblins & Lil'Goblins (Pixel Monster Avatars)

goblins - generate your own 24×24 goblins or 20×20 lil'goblins (pixel) monster avatars images (off chain) from text attributes (via built-in spritesheets); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/goblins](https://rubygems.org/gems/goblins)
* rdoc  :: [rubydoc.info/gems/goblins](http://rubydoc.info/gems/goblins)





##  Usage

Let's generate some super-rare never-before-seen
goblin  monster (pixel) avatars (24x24):

```ruby
require 'goblins'

goblin  = Goblin::Image.generate( 'Green', 'Teeth',
                                   '3D Glasses', 'Blue Sweater' )
goblin.save( "goblin1.png")
goblin.zoom(4).save( "goblin1@4x.png" )


goblin  = Goblin::Image.generate( 'Gold 2', 'Eyes', 'Frown',
                                  'Horns', 'Suit Open' )
goblin.save( "goblin2.png")
goblin.zoom(4).save( "goblin2@4x.png" )


goblin  = Goblin::Image.generate( 'Blue', 'Eyes', 'Smile',
                                  'Hoodie', 'Bow', 'Bojangles' )
goblin.save( "goblin3.png")
goblin.zoom(4).save( "goblin3@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin3.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblin3@4x.png)




Let's try some lil' goblins (20x20):

```ruby
lilgoblin  = LilGoblin::Image.generate( 'Green', 'Orange Beanie',
                                       'Earring Gold', 'Blue Sweater' )
lilgoblin.save( "lilgoblin1.png")
lilgoblin.zoom(4).save( "lilgoblin1@4x.png" )


lilgoblin  = LilGoblin::Image.generate( 'Gold', 'Cool Shades',
                                        'Horns', 'Suit Open' )
lilgoblin.save( "lilgoblin2.png")
lilgoblin.zoom(4).save( "lilgoblin2@4x.png" )


lilgoblin  = LilGoblin::Image.generate( 'Red', 'Chef',
                         'Orange Shades', 'Hoodie', 'Earring Gold' )
lilgoblin.save( "lilgoblin3.png")
lilgoblin.zoom(4).save( "lilgoblin3@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin3.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/lilgoblin3@4x.png)









## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.
