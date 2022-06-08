The Do-It-Yourself (DIY) [Factory of Modern Originals (FoMO)](https://github.com/pixelartexchange/originals) Presents


# Beaux & Belles (Pixel Head Avatars)

Yes, you can! Generate your own 24×24 beau & belle (pixel) head avatars images (off chain) from text attributes (via built-in spritesheet); incl. 2x/4x/8x zoom for bigger sizes and more



* home  :: [github.com/pixelartexchange/pixelart](https://github.com/pixelartexchange/pixelart)
* bugs  :: [github.com/pixelartexchange/pixelart/issues](https://github.com/pixelartexchange/pixelart/issues)
* gem   :: [rubygems.org/gems/belles](https://rubygems.org/gems/belles)
* rdoc  :: [rubydoc.info/gems/belles](http://rubydoc.info/gems/belles)




##  Usage

Let's generate some super-rare never-before-seen
beau & belle (pixel head avatars):


```ruby
require 'belles'

head = Beau::Image.generate( 'Head 1', 'Shades Large Dark', 'Earring',
                      'Beanie Yellow', 'Pout 1', 'Turtleneck Rust' )
head.save( "head1.png")
head.zoom(4).save( "head1@4x.png" )


head = Beau::Image.generate( 'Head 2', 'Staring Brown', 'Side Parting Golden',
                'Snap Back Pink', 'Idle 2', 'Cigarette', 'Tank Top')
head.save( "head2.png")
head.zoom(4).save( "head2@4x.png" )


head = Belle::Image.generate( 'Head 2B', 'Big Staring Brown', 'Black Lipstick',
                'Turtleneck Rust', 'Suspenders', 'Elvish Black', 'Beret Rust' )
head.save( "head3.png")
head.zoom(4).save( "head3@4x.png" )

head = Belle::Image.generate( 'Head 2B', 'Big Staring Blue', 'Top Knot Peach',
                'Hot Lipstick', 'Earring', 'Turtleneck Army', 'Suspenders', 'Chain' )
head.save( "head4.png")
head.zoom(4).save( "head4@4x.png" )
```

Voila!

![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head1.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head2.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head3.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head4.png)

In 4x:

![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head1@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head2@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head3@4x.png)
![](https://github.com/pixelartexchange/pixelart/raw/master/belles/i/head4@4x.png)


And so on.






## Appendix - All Built-In Spritesheet Attributes (24x24px)

See the [spritesheet.csv](https://github.com/pixelartexchange/pixelart/blob/master/belles/config/spritesheet.csv) dataset for all attribute names (w/ categories).

![](https://github.com/pixelartexchange/pixelart/raw/master/belles/config/spritesheet.png)

(Source: [belles/spritesheet.png](https://github.com/pixelartexchange/pixelart/blob/master/belles/config/spritesheet.png))





## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.

