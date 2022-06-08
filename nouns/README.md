The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents

# Nouns (Pixel Avatars)

Yes, you can! Generate your own 32×32 pixel avatar images (off chain) from text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/nouns](https://rubygems.org/gems/nouns)
* rdoc  :: [rubydoc.info/gems/nouns](http://rubydoc.info/gems/nouns)




##  Usage

Let's generate some super-rare never-before-seen
nouns (pixel avatars).

Note:  For best merging / composing (of the attributes)
use the order 1) Body, 2) (Body) Accessory, 3) Head and 4) Glasses:

```ruby
require 'nouns'

#####
# Noun No. 1
noun = Noun::Image.generate( 'Body Grayscale 1',
                             'Checker Bigwalk Rainbow',
                             'Head Beer',
                             'Glasses Square Fullblack' )
noun.save( "noun1.png")
noun.zoom(4).save( "noun1@4x.png" )

## let's add a background
noun = Noun::Image.generate( 'Body Grayscale 1',
                             'Checker Bigwalk Rainbow',
                             'Head Beer',
                             'Glasses Square Fullblack',
                             background: '#638596' )
noun.save( "noun1b.png")
noun.zoom(4).save( "noun1b@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun1b.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun1b@4x.png)



```ruby
###
#  Noun No. 2
noun = Noun::Image.generate( 'Body Red',
                             'Txt LOL',
                             'Head Weed',
                             'Glasses Square Black RGB' )
noun.save( "noun2.png")
noun.zoom(4).save( "noun2@4x.png" )


###
#  Noun No. 3
noun = Noun::Image.generate( 'Body Gold',
                             'Chain Logo',
                             'Head Ape',
                             'Glasses Square Teal' )
noun.save( "noun3.png")
noun.zoom(4).save( "noun3@4x.png" )


###
#  Noun No. 4
noun = Noun::Image.generate( 'Body Green',
                             'Dollar Bling',
                             'Head Bear',
                             'Glasses Square Blue' )
noun.save( "noun4.png")
noun.zoom(4).save( "noun4@4x.png" )


###
#  Noun No. 5
noun = Noun::Image.generate( 'Body Gradient Pride',
                             'Bling Love',
                             'Head Bubblegum',
                             'Glasses Square Yellow Saturated' )
noun.save( "noun5.png")
noun.zoom(4).save( "noun5@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun3.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun4.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun5.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun3@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun4@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/noun5@4x.png)


And so on.

### Bonus - Look-Up Attributes (Via Built-In  Spritesheet)


Let's look-up some attributes:

```ruby
body_gold                 = Noun::Sheet.find_by( name: 'Body Gold' )
txt_pi                    = Noun::Sheet.find_by( name: 'Txt Pi' )
head_weed                 = Noun::Sheet.find_by( name: 'Head Weed' )
glasses_square_black_rgb  = Noun::Sheet.find_by( name: 'Glasses Square Black RGB' )

body_gold.save( "body_gold.png" )
txt_pi.save( "txt_pi.png" )
head_weed.save( "head_weed.png" )
glasses_square_black_rgb.save( "glasses_square_black_rgb.png" )

body_gold.zoom( 4 ).save( "body_gold@4x.png" )
txt_pi.zoom( 4 ).save( "txt_pi@4x.png" )
head_weed.zoom( 4 ).save( "head_weed@4x.png" )
glasses_square_black_rgb.zoom( 4 ).save( "glasses_square_black_rgb@4x.png" )
```



Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/body_gold.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/txt_pi.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/head_weed.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/glasses_square_black_rgb.png)

In 4x:


![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/body_gold@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/txt_pi@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/head_weed@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/i/glasses_square_black_rgb@4x.png)

And so on.



## Appendix - All Built-In Spritesheet Attributes (32x32px)

See the [spritesheet.csv](https://github.com/pixelartexchange/pixelart/blob/master/nouns/config/spritesheet.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/nouns/config/spritesheet.png)

(Source: [nouns/spritesheet.png](https://github.com/pixelartexchange/pixelart/blob/master/nouns/config/spritesheet.png))





## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.


