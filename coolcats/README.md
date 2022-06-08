The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents

# Coolcats (Pixel Cats)

Yes, you can! Generate your own 24×24 pixel cat images (off chain) from text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/coolcats](https://rubygems.org/gems/coolcats)
* rdoc  :: [rubydoc.info/gems/coolcats](http://rubydoc.info/gems/coolcats)




##  Usage

Let's generate some super-rare never-before-seen
coolcats (pixel cats):

```ruby
require 'coolcats'


coolcat = Coolcat::Image.generate( 'Ditto', 'Beret Red' )
coolcat.save( "coolcat1.png")
coolcat.zoom(4).save( "coolcat1@4x.png" )

coolcat = Coolcat::Image.generate( 'Hearts', 'Afro Black' )
coolcat.save( "coolcat2.png")
coolcat.zoom(4).save( "coolcat2@4x.png" )

coolcat = Coolcat::Image.generate( 'Unamused' )
coolcat.save( "coolcat3.png")
coolcat.zoom(4).save( "coolcat3@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat3.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat3@4x.png)



```ruby
## try tv heads

coolcat = Coolcat::Image.generate( 'TV Head White', 'TV Face 404' )
coolcat.save( "coolcat4.png")
coolcat.zoom(4).save( "coolcat4@4x.png" )

coolcat = Coolcat::Image.generate( 'TV Head Grey',  'TV Face No Signal' )
coolcat.save( "coolcat5.png")
coolcat.zoom(4).save( "coolcat5@4x.png" )

coolcat = Coolcat::Image.generate( 'TV Head Purple', 'TV Face XP' )
coolcat.save( "coolcat6.png")
coolcat.zoom(4).save( "coolcat6@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat4.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat5.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat6.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat4@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat5@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat6@4x.png)



```ruby
## try halloween theme

coolcat = Coolcat::Image.generate( 'Jack' )
coolcat.save( "coolcat7.png")
coolcat.zoom(4).save( "coolcat7@4x.png" )

coolcat = Coolcat::Image.generate( 'Scream' )
coolcat.save( "coolcat8.png")
coolcat.zoom(4).save( "coolcat8@4x.png" )

coolcat = Coolcat::Image.generate( 'Beret Red', 'Skull' )
coolcat.save( "coolcat9.png")
coolcat.zoom(4).save( "coolcat9@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat7.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat8.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat9.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat7@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat8@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/coolcat9@4x.png)


And so on.

### Bonus - Look-Up Attributes (Via Built-In  Spritesheet)


Let's look-up some attributes:

```ruby
base            = Coolcat::Sheet.find_by( name: 'Base' )
beanie_orange   = Coolcat::Sheet.find_by( name: 'Beanie Orange' )
costume_gorilla = Coolcat::Sheet.find_by( name: 'Costume Gorilla' )
overalls_blue   = Coolcat::Sheet.find_by( name: 'Overalls Blue' )

base.save( "base.png" )
beanie_orange.save( "beanie_orange.png" )
costume_gorilla.save( "costume_gorilla.png" )
overalls_blue.save( "overalls_blue.png" )

base.zoom( 4 ).save( "base@4x.png" )
beanie_orange.zoom( 4 ).save( "beanie_orange@4x.png" )
costume_gorilla.zoom( 4 ).save( "costume_gorilla@4x.png" )
overalls_blue.zoom( 4 ).save( "overalls_blue@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/base.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/beanie_orange.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/costume_gorilla.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/overalls_blue.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/base@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/beanie_orange@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/costume_gorilla@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/i/overalls_blue@4x.png)

And so on.



## Appendix - All Built-In Spritesheet Attributes (24x24px)

See the [spritesheet.csv](https://github.com/pixelartexchange/pixelart/blob/master/coolcats/config/spritesheet.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/coolcats/config/spritesheet.png)

(Source: [coolcats/spritesheet.png](https://github.com/pixelartexchange/pixelart/blob/master/coolcats/config/spritesheet.png))





## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.
