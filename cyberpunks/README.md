The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents

# Cyberpunks (Pixel Avatars)


Yes, you can! Generate your own cyberpunk (blade runner) sci-fi 32×32 pixel avatar images (off chain) from 100+ text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/cyberpunks](https://rubygems.org/gems/cyberpunks)
* rdoc  :: [rubydoc.info/gems/cyberpunks](http://rubydoc.info/gems/cyberpunks)




##  Usage

Let's generate some super-rare never-before-seen sci-fi (blade runner)
cyberpunk (pixel) avatars / characters.

Note: Note:  For best merging / composing (of the attributes)
use the order 1) Race 2) Face 3) Mouth 4) Nose 5) Eyes 6) Ear Accessory 7) Face Accessory 8) Mask 9) Head Below 10) Eye Accessory 11) Head Above and 12) Mouth Accessory:

```ruby
###
#  Cyberpunk No. 1
base  = Cyberpunk::Image.generate( 'Human 6',
                                   'Goatee Black',
                                   'Idle',
                                   'Upturned Septum Piercing',
                                   'Masc Idle',
                                   'Beanie',
                                   'Cig' )
punk = base
punk.save( "punk1.png")
punk.zoom(4).save( "punk1@4x.png" )

## let's change the background
punk = base.background( 'Codelines' )
punk.save( "punk1b.png")
punk.zoom(4).save( "punk1b@4x.png" )

punk = base.background( '#638596' )
punk.save( "punk1c.png")
punk.zoom(4).save( "punk1c@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1b.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1c.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1b@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1c@4x.png)



```ruby
###
#  Cyberpunk No. 2
base  = Cyberpunk::Image.generate( 'Bot',
                                   'Lipstick Black',
                                   'Bot Nose 3',
                                   'Femme Star Liner',
                                   'Large Hoop Earrings',
                                   'Chainspace Deck Elite I',
                                   'Long Pink Pigtails' )
punk = base
punk.save( "punk2.png")
punk.zoom(4).save( "punk2@4x.png" )

## let's change the background
punk = base.background( 'Pink Diag' )
punk.save( "punk2b.png")
punk.zoom(4).save( "punk2b@4x.png" )

punk = base.background( '#638596' )
punk.save( "punk2c.png")
punk.zoom(4).save( "punk2c@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2b.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2c.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2b@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk2c@4x.png)


```ruby
###
#  Cyberpunk No. 3
base  = Cyberpunk::Image.generate( 'Human 9',
                                   'Smile',
                                   'Delicate',
                                  'Femme Wide',
                                  'Large Hoop Earrings',
                                  'Messy Bun')
punk = base
punk.save( "punk3.png")
punk.zoom(4).save( "punk3@4x.png" )

punk = base.background( 'Orange Tie Dye' )
punk.save( "punk3b.png")
punk.zoom(4).save( "punk3b@4x.png" )

punk = base.background( '#638596' )
punk.save( "punk3c.png")
punk.zoom(4).save( "punk3c@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3b.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3c.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3b@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk3c@4x.png)



```ruby
###
#  Cyberpunk No. 4
base  = Cyberpunk::Image.generate( 'Skull Blue',
                                   'Skull Red Dot',
                                   'Hood',
                                   'Dom Rose' )
punk = base
punk.save( "punk4.png")
punk.zoom(4).save( "punk4@4x.png" )

punk = base.background( 'Metropolis 2' )
punk.save( "punk4b.png")
punk.zoom(4).save( "punk4b@4x.png" )

punk = base.background( '#638596' )
punk.save( "punk4c.png")
punk.zoom(4).save( "punk4c@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4b.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4c.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4b@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk4c@4x.png)


And so on.


### Bonus - Look-Up Attributes (Via Built-In  Spritesheet)


Let's look-up some attributes:

```ruby
skull_gold       = Cyberpunk::Sheet.find_by( name: 'Skull Gold' )
egirl_hair       = Cyberpunk::Sheet.find_by( name: 'E-Girl Hair' )
sun_glasses      = Cyberpunk::Sheet.find_by( name: 'Sun Glasses' )
jack_o_lantern   = Cyberpunk::Sheet.find_by( name: "Jack-O'-Lantern" )

skull_gold.save( "skull_gold.png" )
egirl_hair.save( "egirl_hair.png" )
sun_glasses.save( "sun_glasses.png" )
jack_o_lantern.save( "jack_o_lantern.png" )

skull_gold.zoom( 4 ).save( "skull_gold@4x.png" )
egirl_hair.zoom( 4 ).save( "egirl_hair@4x.png" )
sun_glasses.zoom( 4 ).save( "sun_glasses@4x.png" )
jack_o_lantern.zoom( 4 ).save( "jack_o_lantern@4x.png" )
```


Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/skull_gold.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/egirl_hair.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/sun_glasses.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/jack_o_lantern.png)

In 4x:


![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/skull_gold@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/egirl_hair@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/sun_glasses@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/jack_o_lantern@4x.png)

And so on.




## Appendix - All Built-In Spritesheet Attributes (32x32px)

See the [spritesheet.csv](https://github.com/pixelartexchange/pixelart/blob/master/cyberpunks/config/spritesheet.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/config/spritesheet.png)

(Source: [cyperpunks/spritesheet.png](https://github.com/pixelartexchange/pixelart/blob/master/cyberpunks/config/spritesheet.png))



## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.


