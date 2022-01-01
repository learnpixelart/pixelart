
require 'pixelart'


module PixelArt


class Image

## todo/check: use a new method popart - why? why not?
def popart( cols=20, rows=10,      ## default to 20x10 = 200 grid
            palette: nil, shuffle: false, checker: nil,
            background: '#ffffff' ## use white for now
             )

  composite = ImageComposite.new( cols, rows, width: self.width,
                                              height: self.height )

  background_color = Color.parse( background )

  i=0
  rows.times do |row|
    cols.times do |col|
       i = col + row*cols

    tile = Image.new( self.width, self.height, background_color )

    if checker
      puts " #{i} - #{col}/#{row}"

      ## checker alt pattern
      ##  note: starting counting with zero (odd!!)
      odd_tile, even_tile = if row % 2 == 0
                              [self, checker]
                            else
                              [checker, self]
                            end

      tile.compose!(  (col % 2 == 0) ? odd_tile : even_tile )
    else
      tile.compose!( self )
    end


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
  end

  composite
end  # method popart

end # class Image
end # module PixelArt
