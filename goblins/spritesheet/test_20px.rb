####################
# to run use:
#   $ ruby ./test_20px.rb


require 'pixelart'


names = %w[
  green
  brown
  gray
  red
  gold
]

CHARCOAL_FLIPPED_CAP =   Image.read( './i/20x20/hat/charcoal_flipped_cap.png')
CHEF =                   Image.read( './i/20x20/hat/chef.png')
HORNS =                  Image.read( './i/20x20/hat/horns.png')
HALO =                   Image.read( './i/20x20/hat/halo.png')
ORANGE_BEANIE =          Image.read( './i/20x20/hat/orange_beanie.png')

BOJANGLES   =            Image.read( './i/20x20/earrings/bojangles.png')
EARRINGS_DOUBLE_GOLD =   Image.read( './i/20x20/earrings/double_gold.png')
EARRING_GOLD =           Image.read( './i/20x20/earrings/gold.png')
EARRING_SILVER =         Image.read( './i/20x20/earrings/silver.png')

COOL_SHADES    =      Image.read( './i/20x20/glasses/cool_shades.png')
BLUE_SHADES    =      Image.read( './i/20x20/glasses/blue_shades.png')
ORANGE_SHADES  =      Image.read( './i/20x20/glasses/orange_shades.png')

HOODIE     =   Image.read( './i/20x20/clothes/hoodie.png')
BLUE_HOODIE     =   Image.read( './i/20x20/clothes/blue_hoodie.png')
BLUE_SWEATER    =   Image.read( './i/20x20/clothes/blue_sweater.png')
BLUE_SHIRT      =   Image.read( './i/20x20/clothes/blue_shirt.png')
SUIT_PURPLE_TIE =   Image.read( './i/20x20/clothes/suit-purple_tie.png')


variants = [
  [],   ## none
  [BLUE_SHADES],
  [BLUE_SHADES, CHARCOAL_FLIPPED_CAP, BLUE_HOODIE],
  [ORANGE_BEANIE, EARRING_GOLD, BLUE_SWEATER],
  [HORNS, EARRINGS_DOUBLE_GOLD, HOODIE],
  [CHEF, ORANGE_SHADES, BLUE_SHIRT],
  [SUIT_PURPLE_TIE, COOL_SHADES],
  [HALO, BLUE_HOODIE, BOJANGLES],
]


goblins  = ImageComposite.new( variants.size, names.size,
                                   background: '#638596',
                                   width: 20,
                                   height: 20 )


names.each do |name|
  base = Image.read( "./i/20x20/#{name}.png" )

  variants.each_with_index do |attributes, i|
     goblin = Image.new( 20, 20 )
     goblin.compose!( base )
     attributes.each do |attribute|
      goblin.compose!( attribute )
     end

     goblin.save( "./tmp/#{name}#{i}-20x20.png")
     goblin.zoom(4).save( "./tmp/#{name}#{i}-20x20@4x.png")

     goblins << goblin
  end
end

goblins.save( "./tmp/goblins-20x20.png" )
goblins.zoom(4).save( "./tmp/goblins-20x20@4x.png" )


puts "bye"