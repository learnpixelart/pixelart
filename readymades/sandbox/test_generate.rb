###
#  to run use
#     ruby -I ./lib sandbox/test_generate.rb



require 'readymades'


names = [
  'William Shakespeare',
  'Bart Simpson',
  'Dante Alighieri',
  'Galileo Galilei',
  'Mao Zedong',
  'Snoop Dogg',
  'Terminator',
  'The Joker',
  'The Grinch',
  'The Mask',
]

variants = [
  [],   ## none
  ['Heart Shades'],
  ['Heart Shades', 'Birthday Hat', 'Bubble Gum'],
  ['Headband', 'Pipe'],
  ['Pipe', '3D Glasses', 'Cap Forward'],
  ['Nerd Glasses', 'Beanie'],
  ['Horned Rim Glasses', 'Earring'],
  ['VR'],
  ['Hoodie'],
]


punks  = ImageComposite.new( variants.size, names.size, background: '#638596' )


names.each do |name|
  variants.each_with_index do |attributes, i|
     punk = Readymade::Image.generate( name, *attributes )

     slug = name.downcase.gsub( ' ', '_' )

     punk.save( "./tmp/#{slug}#{i}.png")
     punk.zoom(4).save( "./tmp/#{slug}#{i}@4x.png")

     punks << punk
  end
end

punks.save( "./tmp/readymades.png" )
punks.zoom(4).save( "./tmp/readymades@4x.png" )



punks  = ImageComposite.new( 3, 3, background: '#638596' )

variants.each_with_index do |attributes, i|
  name = 'Hannibal'
  punk = Readymade::Image.generate( name, *attributes )

  slug = name.downcase.gsub( ' ', '_' )

  punk.save( "./tmp/#{slug}#{i}.png")
  punk.zoom(4).save( "./tmp/#{slug}#{i}@4x.png")

  punks << punk
end

punks.save( "./tmp/readymades-hannibals.png" )
punks.zoom(4).save( "./tmp/readymades-hannibals@4x.png" )




base = Readymade::Image.generate( 'Will', '3D Glasses', 'Earring' )  ## note: use a "base" punk for background variants
punk = base.background( 'Ukraine' )
punk.save( "./tmp/will0.png")
punk.zoom(8).save( "./tmp/will0@8x.png")

punk = base.background( 'Red' )
punk.save( "./tmp/will1.png")
punk.zoom(8).save( "./tmp/will1@8x.png")



base = Readymade::Image.generate( 'Snoop Dogg', 'VR', 'Earring' )  ## note: use a "base" punk for background variants
punk = base.background( 'Ukraine')
punk.save( "./tmp/snoop0.png")
punk.zoom(8).save( "./tmp/snoop0@8x.png")

punk = base.background( 'Red' )
punk.save( "./tmp/snoop1.png")
punk.zoom(8).save( "./tmp/snoop1@8x.png")



base = Readymade::Image.generate( 'Terminator' )

punk = base.add( 'VR' )      ## build in steps
punk.save( "./tmp/terminator.png")
punk.zoom(8).save( "./tmp/terminator@8x.png")

punk = punk.background( 'Matrix 1', 'Rainbow 1' )
punk.save( "./tmp/terminator-bg.png")
punk.zoom(8).save( "./tmp/terminator-bg@8x.png")


puts "bye"
