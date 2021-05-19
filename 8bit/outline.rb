$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart'



def to_design( img )
  ## get color usage by pixel
  usage = Hash.new(0)
  img.pixels.each do |color|
    usage[ color ] += 1
  end

  puts "#{usage.size} color(s):"
  usage.each_with_index do |(color,count),i|
    print "  [#{i}]"
    print '%4d  ' % count
    print "  #{Color.format(color)}"
    print "\n"
  end

  colors = usage.keys


  color_map = {
    0x0   => 0,     # transparent
  }

  colors.each do |color|
      color_map[ color ] ||= color_map.size
  end


  puts "color map:"
  pp color_map


  data = []
  img.height.times do |y|
    row = []
    img.width.times do |x|
      color = img[x,y]
      row << color_map[color]
    end
    data << row
  end
  data
end


def to_txt( design )
  buf = String.new('')

  design.each do |row|
    buf << row.join( ' ' )
    buf << "\n"
  end
  buf
end





def outline( type:, name: )
  path = "./img/#{type}/#{name}.png"
  img = Image.read( path )


  pix = Pixelator.new( img, 20, 20 )

  # puts " YES - can auto-pixelate / minify image "  if pix.can_pixelate?

  pix.grid.save( "./o/#{type}-#{name}-grid.png" )
  pix.pixelate.save( "./o/#{type}-#{name}-20x20.png" )


  outline = pix.outline
  outline.save( "./o/#{type}-#{name}-outline.png" )

  design = to_design( outline )

  puts "---"
  puts to_txt( design )
end





outline( type: 'female', name: 'face1' )
outline( type: 'male',   name: 'face4' )


puts "bye"

