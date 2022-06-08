# Pixel Art Characters

pixelart-characters - generate pixel arts characters, algorithmically - paint by numbers - what about a new punk avatar portrait series? - yes, you can!


* home  :: [github.com/rubycoco/pixel](https://github.com/rubycoco/pixel)
* bugs  :: [github.com/rubycoco/pixel/issues](https://github.com/rubycoco/pixel/issues)
* gem   :: [rubygems.org/gems/pixelart-characters](https://rubygems.org/gems/pixelart-characters)
* rdoc  :: [rubydoc.info/gems/pixelart-characters](http://rubydoc.info/gems/pixelart-characters)




## Usage

### Example №1 - 8-Bit Icon Series (20x20)

Let's try the 8-bit icon series with a 20x20 pixel art image set,
see [/design.punks/8bit](https://github.com/cryptopunksnotdead/design.punks#8-bit-icon-series-20x20).


Step 1: Map the pixel art images
(or designs in ascii text)
to a characters generation definition.


``` ruby
require 'pixelart/characters'

######
# skin tone colors
HUMAN_LIGHTER_BASE1 = '0xead9d9'   # rgb(234 217 217) - hsl(  0°  29%  88%)
HUMAN_LIGHT_BASE1   = '0xdbb180'   # rgb(219 177 128) - hsl( 32°  56%  68%)
HUMAN_DARK_BASE1    = '0xae8b61'   # rgb(174 139  97) - hsl( 33°  32%  53%)
HUMAN_DARKER_BASE1  = '0x713f1d'   # rgb(113  63  29) - hsl( 24°  59%  28%)


###############
# characters generation definition
CHARACTERS = {
  'male'   => {
    'face' => [{ design: 'male', colors: [HUMAN_LIGHTER_BASE1] },
               { design: 'male', colors: [HUMAN_LIGHT_BASE1] },
               { design: 'male', colors: [HUMAN_DARK_BASE1] },
               { design: 'male', colors: [HUMAN_DARKER_BASE1] }],
    'clothes' => (1..65).to_a,
    'eye'     => (1..32).to_a,
    'mouth'   => (1..26).to_a,
    'hair'    => (1..36).to_a,
  },
  'female' => {
     'face' => [{ design: 'female', colors: [HUMAN_LIGHTER_BASE1] },
                { design: 'female', colors: [HUMAN_LIGHT_BASE1] },
                { design: 'female', colors: [HUMAN_DARK_BASE1] },
                { design: 'female', colors: [HUMAN_DARKER_BASE1] }],
     'clothes' => (1..59).to_a,
     'eye'     => (1..53).to_a,
     'mouth'   => (1..17).to_a,
     'hair'    => (1..33).to_a,
  }
}
```


Note: List all parts (such as face, clothes, eyes, etc.) that make up
a character in the paste order, that is,
the algo will generate an empty pixel image / canvas and than adds - or is that composes or pastes - one part after the other on top all the way from face to hair.



Let's set up the character generator (or is that artist?) by
passing in the characters definition and
the root directory housing all the the pixel art:

``` ruby
artist = Character.new( CHARACTERS,
                        dir: "./8bit" )
```


Let's generate some characters.
Let's start with a male using the part selection (1,1,1,1,1) - that is,
face #1, clothes #1, eye #1, mouth #1, and hair #1 -
and so on:


``` ruby
img = artist.generate( 'male', 1, 1, 1, 1, 1 )
img.save( '8bit-male1.png')
img.zoom(4).save( '8bit-male1x4.png')

img = artist.generate( 'male', 2, 2, 2, 2, 2 )
img.save( '8bit-male2.png')
img.zoom(4).save( '8bit-male2x4.png')

img = artist.generate( 'male', 3, 3, 3, 3, 3 )
img.save( '8bit-male3.png')
img.zoom(4).save( '8bit-male3x4.png')

img = artist.generate( 'male', 4, 4, 4, 4, 4 )
img.save( '8bit-male4.png')
img.zoom(4).save( '8bit-male4x4.png')


img = artist.generate( 'female', 1, 1, 1, 1, 1 )
img.save( '8bit-female1.png')
img.zoom(4).save( '8bit-female1x4.png')

img = artist.generate( 'female', 2, 2, 2, 2, 2 )
img.save( '8bit-female2.png')
img.zoom(4).save( '8bit-female2x4.png')

img = artist.generate( 'female', 3, 3, 3, 3, 3 )
img.save( '8bit-female3.png')
img.zoom(4).save( '8bit-female3x4.png')

img = artist.generate( 'female', 4, 4, 4, 4, 4 )
img.save( '8bit-female4.png')
img.zoom(4).save( '8bit-female4x4.png')
```

Voila!

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male2.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female2.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female4.png)

4x

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male1x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male2x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male3x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male4x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female1x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female2x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female3x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female4x4.png)



Let the artist do the painting, that is, let the computer fill in the numbers
with a random lottery.

``` ruby
img = artist.random( 'male' )
img.save( '8bit-male-random1.png')
img.zoom(4).save( '8bit-male-random1x4.png')

img = artist.random( 'female' )
img.save( '8bit-female-random1.png')
img.zoom(4).save( '8bit-female-random1x4.png')

img = artist.random
img.save( '8bit-random1.png')
img.zoom(4).save( '8bit-random1x4.png')

img = artist.random
img.save( '8bit-random2.png')
img.zoom(4).save( '8bit-random2x4.png')
```

Voila!

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male-random1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female-random1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-random1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-random2.png)

4x

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-male-random1x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-female-random1x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-random1x4.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/8bit-random2x4.png)




### Example №2 - "SubstraPunks" - CryptoPunks, Polkadot Edition (32x32)


Let's try the "SubstraPunks", that is, the CryptoPunks, Polkadot Edition series with a 32x32 pixel art image set,
see [Inside the Punk Art Machinery - How To Generate 10 000 Punks (and Punkettes), Algorithmically - Paint by Numbers](https://github.com/cryptopunksnotdead/programming-cryptopunks/blob/master/03_generate.md) in the Programming CryptoPunks & Copypastas book(let).


Step 1: Map the pixel art images
(or designs in ascii text)
to a characters generation definition.


``` ruby
PARTS = {
  face:  { required: true,
           attributes: [['', 'u'],
                        ['', 'u']] },
  mouth: { required: true,
           attributes: [['Black Lipstick',  'f'],
                        ['Red Lipstick',    'f'],
                        ['Smile',           'u'],
                        ['',                'u'],
                        ['Teeth Smile',     'm'],
                        ['Purple Lipstick', 'f']] },
  nose:  { required: true,
           attributes: [['',          'u'],
                        ['Nose Ring', 'u']] },
  eyes:  { required: true,
           attributes: [['',              'u'],
                        ['Asian Eyes',    'u'],
                        ['Sun Glasses',   'u'],
                        ['Red Glasses',   'u'],
                        ['Round Eyes',    'u']] },
  ears:  { required: true,
           attributes: [['',              'u'],
                        ['Left Earring',  'u'],
                        ['Right Earring', 'u'],
                        ['Two Earrings',  'u']] },
  beard: { required: false,
           attributes: [['Brown Beard',     'm'],
                        ['Mustache-Beard',  'm'],
                        ['Mustache',        'm'],
                        ['Regular Beard',   'm']] },
  hair:  { required: false,
           attributes: [['Up Hair',        'm'],
                        ['Down Hair',      'u'],
                        ['Mahawk',         'u'],
                        ['Red Mahawk',     'u'],
                        ['Orange Hair',    'u'],
                        ['Bubble Hair',    'm'],
                        ['Emo Hair',       'u'],
                        ['Thin Hair',      'm'],
                        ['Bald',           'm'],
                        ['Blonde Hair',    'f']] }
 }
```


Note: This characters generation definition uses the "compact" format
with "auto-implied" male and female types and
using the m/f/u type flags -
standing in for male, female and both (that is, unisex).


Let's set up the character generator (or is that artist?) by
passing in the characters definition and
the root directory housing all the the pixel art:

``` ruby
artist = Character.new( PARTS, dir: "./parts",
                               format: 'compact' )
```


Let's generate some characters.

``` ruby
img = artist.generate( 'female', 2, 2, 2, 3, 1, 6 )
img.save( 'polka-female.png')
img.zoom(3).save( 'polka-femalex3.png')

img = artist.generate( 'male', 1, 3, 2, 3, 1, 1, 5 )
img.save( 'polka-male.png')
img.zoom(3).save( 'polka-malex3.png')
```

Voila!

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-female.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-male.png)

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-femalex3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-malex3.png)


And with a random lottery.

``` ruby
img = artist.random( 'female' )
img.save( 'polka-female-random.png')
img.zoom(3).save( 'polka-female-randomx3.png')

img = artist.random( 'male' )
img.save( 'polka-male-random.png')
img.zoom(3).save( 'polka-male-randomx3.png')

img = artist.random
img.save( 'polka-random1.png')
img.zoom(3).save( 'polka-random1x3.png')

img = artist.random
img.save( 'polka-random2.png')
img.zoom(3).save( 'polka-random2x3.png')

img = artist.random
img.save( 'polka-random3.png')
img.zoom(3).save( 'polka-random3x3.png')
```

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-female-random.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-male-random.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random1.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random2.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random3.png)

![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-female-randomx3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-male-randomx3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random1x3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random2x3.png)
![](https://github.com/rubycoco/pixel/raw/master/pixelart-characters/i/polka-random3x3.png)


That's it.



## Install

Just install the gem:

    $ gem install pixelart-characters


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.




## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.

