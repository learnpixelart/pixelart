The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents

# Shiba Inus (Pixel Doge)

Yes, you can! Generate your own 24×24 pixel shiba inu doge images (off chain) from text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more


* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/shibainus](https://rubygems.org/gems/shibainus)
* rdoc  :: [rubydoc.info/gems/shibainus](http://rubydoc.info/gems/shibainus)




##  Usage

Let's generate some super-rare never-before-seen
shiba inu (pixel doge):

```ruby
require 'shibainus'

doge = Shiba::Image.generate( 'Classic', '3D Glasses' )
doge.save( "doge1.png")
doge.zoom(4).save( "doge1@4x.png" )

doge = Shiba::Image.generate( 'Dark', 'Tiara', 'Big Shades' )
doge.save( "doge2.png")
doge.zoom(4).save( "doge2@4x.png" )

doge = Shiba::Image.generate( 'Zombie', 'Crazy Hair' )
doge.save( "doge3.png")
doge.zoom(4).save( "doge3@4x.png" )

doge = Shiba::Image.generate( 'Alien', 'Headband' )
doge.save( "doge4.png")
doge.zoom(4).save( "doge4@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge3.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge4.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge3@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/doge4@4x.png)


And so on.

### Bonus - Look-Up Attributes (Via Built-In  Spritesheet)


Let's look-up some attributes:

```ruby
classic         = Shiba::Sheet.find_by( name: 'Classic' )
crazy_hair      = Shiba::Sheet.find_by( name: 'Crazy Hair' )
beanie          = Shiba::Sheet.find_by( name: 'Beanie' )
big_shades      = Shiba::Sheet.find_by( name: 'Big Shades' )

classic.save( "classic.png" )
crazy_hair.save( "crazy_hair.png" )
beanie.save( "beanie.png" )
big_shades.save( "big_shades.png" )

classic.zoom( 4 ).save( "classic@4x.png" )
crazy_hair.zoom( 4 ).save( "crazy_hair@4x.png" )
beanie.zoom( 4 ).save( "beanie@4x.png" )
big_shades.zoom( 4 ).save( "big_shades@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/classic.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/crazy_hair.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/beanie.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/big_shades.png)

In 4x:


![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/classic@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/crazy_hair@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/beanie@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/i/big_shades@4x.png)

And so on.



## Appendix - All Built-In Spritesheet Attributes (24x24px)

See the [spritesheet.csv](https://github.com/pixelartexchange/pixelart/blob/master/shibainus/config/spritesheet.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/shibainus/config/spritesheet.png)

(Source: [shibainus/spritesheet.png](https://github.com/pixelartexchange/pixelart/blob/master/shibainus/config/spritesheet.png))





## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.
