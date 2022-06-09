####################
# to run use:
#   $ ruby spritesheet/generate.rb


require 'cryptopunks'


names = %w[
  william_shakespeare
  bart_simpson
  dante_alighieri
  galileo_galilei
  mao_zedong
  snoop_dogg
  terminator
  the_joker
  the_grinch
  the_mask
]

HEART_SHADES = Punks::Sheet.find_by( name: 'Heart Shades', gender: 'm' )
HEADBAND     = Punks::Sheet.find_by( name: 'Headband', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
CAP_FORWARD  = Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses',  gender: 'm' )
BIRTHDAY_HAT = Punks::Sheet.find_by( name: 'Birthday Hat',  gender: 'm' )
BUBBLE_GUM   = Punks::Sheet.find_by( name: 'Bubble Gum',  gender: 'm' )

NERD_GLASSES       = Punks::Sheet.find_by( name: 'Nerd Glasses',  gender: 'm' )
HORNED_RIM_GLASSES = Punks::Sheet.find_by( name: 'Horned Rim Glasses', gender: 'm' )
VR                 = Punks::Sheet.find_by( name: 'VR', gender: 'm' )

HOODIE             = Punks::Sheet.find_by( name: 'Hoodie', gender: 'm' )
BEANIE             = Punks::Sheet.find_by( name: 'Beanie', gender: 'm' )

EARRING            = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )

variants = [
  [],   ## none
  [HEART_SHADES],
  [HEART_SHADES, BIRTHDAY_HAT, BUBBLE_GUM],
  [HEADBAND, PIPE],
  [PIPE, _3D_GLASSES, CAP_FORWARD],
  [NERD_GLASSES, BEANIE],
  [HORNED_RIM_GLASSES, EARRING],
  [VR],
  [HOODIE],
]


punks  = ImageComposite.new( variants.size, names.size, background: '#638596' )


names.each do |name|
  base = Image.read( "./spritesheet/i/#{name}.png" )

  variants.each_with_index do |attributes, i|
     punk = Image.new( 24, 24 )
     punk.compose!( base )
     attributes.each do |attribute|
      punk.compose!( attribute )
     end

     punk.save( "./tmp/#{name}#{i}.png")
     punk.zoom(4).save( "./tmp/#{name}#{i}@4x.png")

     punks << punk
  end
end

punks.save( "./tmp/readymades.png" )
punks.zoom(4).save( "./tmp/readymades@4x.png" )


puts "bye"