# Cyberpunks (Pixel Avatars)


cyberpunks - generate your own cyberpunk (blade runner) sci-fi 32×32 pixel avatar images (off chain) from text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/cyberpunks](https://rubygems.org/gems/cyberpunks)
* rdoc  :: [rubydoc.info/gems/cyberpunks](http://rubydoc.info/gems/cyberpunks)




##  Usage

Let's generate some super-rare never-before-seen sci-fi (blade runner)
cyberpunk (pixel avatars).

Note: Note:  For best merging / composing (of the attributes)
use the order 1) Background 2) Race 3) Face 4) Mouth 5) Nose 6) Eyes 7) Ear Accessory 8) Face Accessory 9) Mask 10) Head Below 11) Eye Accessory 12) Head Above and 13) Mouth Accessory:

```ruby
###
#  Cyberpunk No. 1
punk  = Cyberpunk::Image.generate( 'Codelines',
                                   'Human 6',
                                   'Goatee Black',
                                   'Idle',
                                   'Upturned Septum Piercing',
                                   'Masc Idle',
                                   'Beanie',
                                   'Cig' )

punk.save( "punk1.png")
punk.zoom(4).save( "punk1@4x.png" )

## let's change the background
punk  = Cyberpunk::Image.generate( 'Human 6',
                                   'Goatee Black',
                                   'Idle',
                                   'Upturned Septum Piercing',
                                   'Masc Idle',
                                   'Beanie',
                                   'Cig',
                                   background: '#638596' )

punk.save( "punk1b.png")
punk.zoom(4).save( "punk1b@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1b.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/i/punk1b@4x.png)









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

See the [**spritesheet.csv**](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/config/spritesheet.csv) dataset for all categories and attribute names.

![](https://github.com/pixelartexchange/pixelart/raw/master/cyberpunks/config/spritesheet.png)





## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.