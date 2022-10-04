#####
#  prepare (generate) all smiley archetypes
#    from base colors

require 'pixelart'


diameters = [ 15,16,17,20 ]

colors = { 'yellow'  => '#FCF803',
           'red'     => '#E6343A',
           'white'   => '#FFFFFF',
           'orange'  => '#EC9430',
           'green'   => '#9BE500',
           'greener' => '#61D000',
           }


diameters.each do |diameter|

  base = Image.read( "./attributes/dia#{diameter}/yellow.png" )

  colors.each do |color_name, color_hex|
    img = base.change_colors( { '#FCF803' => color_hex } )
    img.save( "./attributes/dia#{diameter}/base/#{color_name}.png" )

    ## no outline version
    ##  assume all black pixels are outline pixels fornow
    img = base.change_colors( { '#FCF803' => color_hex,
                                '#000000' => color_hex } )
    img.save( "./attributes/dia#{diameter}/base/#{color_name}.no.png" )
  end
end



puts "bye"