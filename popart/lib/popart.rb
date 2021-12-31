
require 'pixelart'


module PixelArt


class Image

## todo/check: use a new method popart - why? why not?
def popart( cols=20, rows=10,      ## default to 20x10 = 200 grid
            palette: nil, shuffle: false )

  composite = ImageComposite.new( cols, rows, width: self.width,
                                              height: self.height )

 background = Color.parse( '#ffffff' )  ## use white for now

  (cols*rows).times do |i|

    tile = Image.new( self.width, self.height, background )
    tile.compose!( self )

    if palette
       if shuffle
          if shuffle.is_a?( Proc )
            puts "  calling shuffle proc"
            palette = shuffle.call( palette )
            puts "  calling shuffle proc ... #{palette[0..4]}"
          else ## assume bool (true )
            palette = palette.shuffle
          end
        end
        tile = tile.change_palette8bit( palette )
    end

    composite << tile
  end

  composite
end  # method popart

end # class Image
end # module PixelArt
