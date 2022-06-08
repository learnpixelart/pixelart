The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents


# Goblins & Lil' Goblins (Pixel Monster Avatars)

Yes, you can! Generate your own 24×24 goblins or 20×20 lil' goblins (pixel) monster avatars images (off chain) from text attributes (via built-in spritesheets); incl. 2x/4x/8x zoom for bigger sizes and more



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
                                       'Earring Silver', 'Blue Sweater' )
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



## Bonus - Ugly, Uglier, Ugliest - Yes, You Can - Design Your Own Goblin (Pixel) Monsters  - Original 1/1 Goblin Monster Starter Kit

Is ugly the new beau / belle?  Yes, you can. Design your own goblin (pixel) monsters.


![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/i/goblins_originals-24x24@4x.png)

To get you started find a series of original 1/1 goblin monsters  (see above in 4x zoom) and a script to (auto-)generate some variants (with horns, cap forward, hoodies, golden earrings, & more)  in the [goblins/sandbox »](https://github.com/pixelartexchange/pixelart/tree/master/goblins/sandbox)






## Appendix - All Built-In Spritesheet Attributes

**Goblins (24x24px)**

See the [spritesheet-24x24.csv](https://github.com/pixelartexchange/pixelart/blob/master/goblins/config/spritesheet-24x24.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/config/spritesheet-24x24.png)

(Source: [goblins/spritesheet-24x24.png](https://github.com/pixelartexchange/pixelart/blob/master/goblins/config/spritesheet-24x24.png))


**Lil' Goblins (20x20px)**


See the [spritesheet-20x20.csv](https://github.com/pixelartexchange/pixelart/blob/master/goblins/config/spritesheet-20x20.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/goblins/config/spritesheet-20x20.png)

(Source: [goblins/spritesheet-20x20.png](https://github.com/pixelartexchange/pixelart/blob/master/goblins/config/spritesheet-20x20.png))




## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.

