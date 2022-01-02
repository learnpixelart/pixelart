
require 'pixelart'


module PixelArt


class Image

## todo/check: use a new method popart - why? why not?
## note: defaults to 20x10 = 200 grid
def popart( cols=20, rows=10,
            palette: nil, shuffle: false, checker: nil,
            background: nil
          )

  composite = ImageComposite.new( cols, rows, width: self.width,
                                              height: self.height )

  background ||= '#ffffff'    ## default to white (#ffffff) for now

  ## wrap into an array if not already an array
  ##  and convert all colors to true rgba colors as integer numbers
  background = [background]   unless background.is_a?( Array )
  background_colors = background.map { |color| Color.parse( color ) }


  i=0
  rows.times do |row|
    cols.times do |col|
       i = col + row*cols

    ## note: cycle through background color for now
    background_color = background_colors[i % background_colors.size]
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



###
#  pre-made/configured "thirty or X is better than one" formats

def double( background: nil )  popart( 2, 1, background: background ); end
alias_method :two,       :double
alias_method :double_ii, :double

def triple( background: nil )  popart( 3, 1, background: background ); end
alias_method :three,      :triple
alias_method :double_iii, :triple

def quadruple( background: nil )  popart( 2, 2, background: background ); end
alias_method :four,        :quadruple
alias_method :double_iiii, :quadruple
alias_method :double_iv,   :quadruple




def twohundred( background: nil ) popart( 20, 10, background: background ); end
alias_method :two_hundred, :twohundred
alias_method :double_cc,   :twohundred   # roman numerals (cc = 200)

def twohundredten( background: nil ) popart( 21, 10, background: background ); end
alias_method :two_hundred_ten, :twohundredten
alias_method :double_ccx,      :twohundredten   # roman numerals (ccx = 210)

def thirty( background: nil )  popart( 6, 5, background: background ); end
alias_method :double_xxx, :thirty   # roman numerals (xxx = 30)

def fortytwo( background: nil )  popart( 7, 6, background: background ); end
alias_method :forty_two,   :fortytwo
alias_method :double_xlii, :fortytwo    # roman numberals (xlii = 42)


end # class Image
end # module PixelArt
