###
#  to run use
#     ruby -I ./lib sandbox/test_image.rb


require 'pixelart/base'

## color map  - genesis white
colors = [
  '#555555',
  '#d3d3d3',
  '#ffffff',
  '#aaaaaa',
  '#ff9999'
]

pixels =<<PIXELS
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 0 1 3 1 0 0 0 1 3 1 0
0 0 0 0 0 0 0 0 0 0 0 1 5 3 1 1 1 3 5 1 0
0 1 1 1 0 0 0 0 0 0 1 1 3 3 3 3 3 3 3 1 1
0 1 3 1 0 0 0 0 0 0 1 3 3 3 3 3 3 3 3 3 1
1 3 1 1 0 1 1 1 1 1 1 3 3 1 3 3 3 1 3 3 1
1 3 1 0 1 1 3 3 3 3 1 3 3 3 3 3 3 3 3 3 1
1 3 1 0 1 3 3 3 3 3 1 3 3 4 3 5 3 4 3 3 1
1 3 1 1 1 3 3 3 3 3 1 3 3 3 4 3 4 3 3 3 1
1 1 3 3 3 3 3 3 3 3 3 1 3 3 3 3 3 3 3 1 0
0 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 1 1 1 0 0
0 0 0 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 1 0 0
0 0 0 1 1 3 3 3 1 4 4 4 1 3 3 3 3 3 1 0 0
0 0 0 0 1 1 3 3 3 1 4 1 3 3 1 3 3 1 0 0 0
0 0 0 0 0 1 1 3 3 1 4 1 3 1 1 3 1 0 0 0 0
0 0 0 0 0 0 1 1 3 5 1 1 5 1 1 5 1 0 0 0 0
0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0
PIXELS


img = Pixelart::Image.parse( pixels, colors: colors )
img.save( './i/mooncat_white.png' )

img3x = img.zoom( 3 )
img3x.save( './i/mooncat_white-3x.png' )



## color map - genesis black
colors = [
  '#555555',
  '#222222',
  '#111111',
  '#bbbbbb',
  '#ff9999'
]

img = Pixelart::Image.parse( pixels, colors: colors )
img.save( './i/mooncat_black.png' )

img3x = img.zoom( 3 )
img3x.save( './i/mooncat_black-3x.png' )

## try zoom with spacing
img.zoom(3, spacing:1).save( './tmp/mooncat_black@3x+1.png' )



img = Pixelart::Image.read( './i/mooncat_black.png' )
img3x = img.zoom( 3 )
img3x.save( './tmp/mooncat_black-3x.png' )


###########
## generate 2x2 composite with 4 mooncats (titles)

tile = Pixelart::Image.read( './i/mooncat_black.png' )

img  = Pixelart::Image.new( tile.width*2, tile.height*2 )
img.compose!( tile, 0, 0 )
img.compose!( tile, tile.width, 0 )
img.compose!( tile, 0, tile.height )
img.compose!( tile, tile.width, tile.height )
img.save( './tmp/mooncat_composite.png' )

img.zoom( 3 ).save( './tmp/mooncat_composite-3x.png' )


## Darth Vader example
##  see https://codepen.io/araltasher/pen/ajdzNE

# org size and 5x

## color map
colors = {
   o:   'transparent',
   b:   '#1D191A',
   ulg: '#eaeaec',
   lg:  '#747474',
   db:  '#453C35',
   dg:  '#343031',
   w:   '#fff',
   r:   '#fc3435',
   blu: '#1F3A93',
   g:   '#00943b'
}


## pixel art matrix
pixels = <<PIXELS
o o o o o o o o o o o o o o o o o lg lg lg dg o o o o o o o o o o o o o o o o o
o o o o o o o o o o o o o o dg lg lg w lg lg dg dg lg dg o o o o o o o o o o o o o o
o o o o o o o o o o o o o dg lg w lg w lg lg dg dg w lg  dg o o o o o o o o o o o o o
o o o o o o o o o o o o dg lg w w lg w lg lg dg dg w w  lg dg o o o o o o o o o o o
o o o o o o o o o o o o dg dg w w lg w lg lg dg dg w w  dg dg o o o o o o o o o o o
o o o o o o o o o o o dg dg dg lg w lg w lg lg dg dg w lg dg dg dg o o o o o o o o o o
o o o o o o o o o o o dg dg dg w lg lg w lg lg dg dg lg w dg dg dg o o o o o o o o o o
o o o o o o o o o o o dg dg w lg lg lg w lg lg dg dg lg lg w dg dg o o o o o o o o o o
o o o o o o o o o o o dg lg lg b b b lg dg dg lg b b b lg lg dg o o o o o o o o o o
o o o o o o o o o o o dg lg b b b b b lg lg b b b b b lg dg o o o o o o o o o o
o o o o o o o o o o o lg b b db lg db b dg dg b lg db db b b lg o o o o o o o o o o
o o o o o o o o o o lg b b b db db db b lg lg b db db db b b b lg o o o o o o o o o
o o o o o o o o o o lg b b dg lg lg lg lg b b lg lg lg lg dg b b lg o o o o o o o o o
o o o o o o o o o lg b b b dg dg dg dg lg b b lg dg dg dg dg b b b lg o o o o o o o o
o o o o o o o o o lg b b b dg dg dg lg b b b b lg dg dg dg b b b lg o o o o o o o o
o o o o o o o o lg b b b b b dg dg b dg b dg b b lg dg b b b b b lg o o o o o o o
o o o o o o o o b b b b b b w b b dg b dg b dg b w b b b b b b o o o o o o o
o o o o o o o o b b b b b b dg dg dg dg dg dg dg dg dg dg b b b b b b o o o o o o o
o o o o o o o o o b b b b lg b b b b b b b b b b b b b b b o o o o o o o o
o o o o o o o o o o o o b lg lg dg dg b b b b dg dg b b b o o o o o o o o o o o
o o o o o o o o o o o o lg lg dg dg dg dg b b b dg dg dg dg b b o o o o o o o o o o
o o o o o o o o o dg dg b dg dg dg dg dg dg dg dg dg dg dg dg dg dg dg b dg dg o o o o o o o
o o o o o o o o dg dg b b lg lg lg lg lg lg lg lg lg lg lg lg lg lg lg b b dg dg o o o o o o
o o o o o o o dg dg b lg b lg dg lg lg dg dg lg lg dg dg lg lg dg dg lg b lg b dg dg o o o o o
o o o o o o dg dg b lg lg b lg dg lg lg dg dg lg lg dg dg lg lg dg dg lg b lg lg b dg dg o o o o
o o o o o dg dg b b b b b lg dg lg lg dg dg lg lg dg dg lg lg dg dg lg b b b b b dg dg
o o o o dg dg dg b dg dg b b b b lg lg dg dg lg lg dg dg lg lg b b b b dg dg dg b dg dg dg
o o o dg dg dg b dg dg dg b b b dg b b dg dg lg lg dg dg b b b dg b b b dg dg dg b dg dg dg
o o o dg dg b dg dg dg b b b dg dg dg b b b lg lg b b b dg dg dg b b b b dg dg dg b dg dg
o o dg dg dg b dg dg b b b b dg dg dg b lg lg b b lg lg dg dg dg dg b b b b b dg dg b dg dg dg
o o dg dg dg b dg b b b b b dg dg dg b b b b b b b dg b dg dg b b b b b b dg b dg dg dg
o dg dg dg dg b dg b b b b b dg b dg b b lg lg b r b dg b dg dg b b b b b b dg b dg dg dg dg
o dg dg dg dg b dg lg b b b b dg b dg b b b b b b b dg b dg dg b b b b b lg dg b dg dg dg dg
o dg dg dg dg b lg dg lg b b b dg b dg b b lg lg b blu b dg b dg dg b b b b lg dg lg b dg dg dg dg
o dg dg dg dg b dg lg dg lg b b dg b dg b b b b b b b dg b dg dg b b b lg dg lg dg b dg dg dg dg
o dg dg dg dg b dg dg lg dg lg b dg b dg b lg lg lg lg lg lg b b dg dg b b lg dg lg dg dg b dg dg dg dg
o dg dg dg dg b b dg dg lg dg b b b b b b b b b b b b b b b b b dg lg dg dg b b dg dg dg dg
o dg dg dg dg b b b dg dg dg b lg b g b b lg lg lg lg b b g b lg b b dg dg dg b b b dg dg dg dg
o dg dg dg dg b b b b dg b b b b b b b dg dg lg lg b b b b b b b b dg b b b b dg dg dg dg
o dg dg dg dg b b b b b b b b b b b b b b b b b b b b b b b b b b b b b dg dg dg dg
o dg dg dg dg b b b b b b b dg b dg b dg dg dg dg dg dg b dg b lg b b b b b b b b dg dg dg dg
o dg dg dg b b b b b b b b dg b dg b dg dg dg dg dg dg b dg b lg dg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b b dg dg b dg dg dg dg dg dg b dg b dg dg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b b dg dg b b dg dg dg dg b b dg b w lg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b b dg dg b b dg dg dg dg b b dg b w lg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b b dg dg b dg b dg dg b dg b dg b lg dg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b b dg dg b dg dg b b dg dg b dg b dg dg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b dg dg dg b dg dg b dg dg dg b dg b lg dg b b b b b b b b dg dg dg
o dg dg dg b b b b b b b b dg dg dg b dg dg b dg dg dg b dg b lg dg b b b b b b b b dg dg dg
dg dg dg dg b b b b b b b b dg dg dg b dg dg b dg dg dg b dg b lg dg b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg dg dg b dg b b b dg dg b dg b b b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg dg dg b dg b b b dg dg b dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg dg dg b dg b b b dg dg b dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg b dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg b dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg b dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg b dg b dg b b b dg dg b dg b dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b b b b b dg b b b dg dg b b b b b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg lg dg dg dg b b b dg lg dg dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b b b b b b b dg lg dg dg dg b b b dg lg dg dg dg dg b b b b b b b b b dg dg dg dg
dg dg dg dg b b o o o o o o b b b dg dg b b b dg dg dg b b b o o o o o o o b b dg dg dg dg
o o dg dg o o o o o o o b lg lg dg b b b o o b b lg dg dg dg b o o o o o o b b dg dg dg dg
o o o o o o o o o b lg lg dg dg dg dg dg b o o b dg lg lg dg dg dg b
o o o o o o o o b dg dg dg dg dg dg dg dg b o o b dg dg dg dg dg dg b b
o o o o ulg ulg ulg ulg b b b b b b b b b b ulg ulg b b b b b b b b b ulg ulg ulg ulg
PIXELS


img = Pixelart::Image.parse( pixels, colors: colors )
img.save( './i/vader.png' )

imgx5 = img.zoom( 5 )
imgx5.save( './i/vader5x.png' )


puts "bye"

