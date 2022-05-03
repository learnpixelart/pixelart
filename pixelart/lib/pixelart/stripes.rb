module Pixelart
  class Image


def self.calc_stripes( length, n: 2, debug: false )
  stripes = []

  base_step = length / n    ## pixels per pixel

  err_step = (length % n) * 2   ## multiply by 2
  denominator =  n * 2   # denominator (in de - nenner  e.g. 1/nenner 4/nenner)

  overflow = err_step*n/denominator  ## todo/check - assert that div is always WITHOUT remainder!!!!!

  if debug
    puts
    puts "base_step (pixels per stripe):"
    puts "  #{base_step}     -  #{base_step}px * #{n} = #{base_step*n}px"
    puts "err_step  (in 1/#{length}*2):"
    puts "  #{err_step} / #{denominator}      - #{err_step*n} / #{denominator} = +#{err_step*n/denominator}px overflow"
    puts
  end

  err    = 0
  stripe = 0

  n.times do |i|
    stripe  = base_step
    err    += err_step

    if err >= denominator ## overflow
      puts "    -- overflow #{err}/#{denominator} - add +1 pixel to stripe #{i}"  if debug

      stripe += 1
      err   -= denominator
    end


    puts "  #{i} => #{stripe}  -- #{err} / #{denominator}"  if debug

    stripes[i] = stripe
  end

  ## note: assert calculation - sum of stripes MUST be equal length
  sum = stripes.sum
  puts "  sum: #{sum}"  if debug

  if sum != length
    puts "!! ERROR - stripes sum #{sum} calculation failed; expected #{length}:"
    pp stripes
    exit 1
  end

  stripes
end


def stripes_horizontal( *colors )
  colors = colors.map { |color| Color.parse( color ) }

  img = Image.new( @img.width, @img.height )

  n = colors.size
  lengths = self.class.calc_stripes( @img.height, n: n )

  i      = 0
  length = lengths[0]
  color  = colors[0]

  @img.height.times do |y|
    if y >= length
      i      += 1
      length += lengths[i]
      color   = colors[i]
    end
    @img.width.times do |x|
      img[x,y] = color
    end
  end

  img.compose!( self )  ## paste/compose image onto backgorund
  img
end
alias_method :stripes, :stripes_horizontal



### todo/check: move colors to (reusable) constants int Color !!!! why? why not?
RAINBOW_RED    = Color.parse( '#E40303' )
RAINBOW_ORANGE = Color.parse( '#FF8C00' )
RAINBOW_YELLOW = Color.parse( '#FFED00' )
RAINBOW_GREEN  = Color.parse( '#008026' )
RAINBOW_BLUE   = Color.parse( '#004DFF' )
RAINBOW_VIOLET = Color.parse( '#750787' )


def rainbow
  ##
  # the most common variant consists of six stripes:
  #   red, orange, yellow, green, blue, and violet.
  # The flag is typically flown horizontally,
  #  with the red stripe on top, as it would be in a natural rainbow
  #
  #  see https://en.wikipedia.org/wiki/Rainbow_flag_(LGBT)
  stripes( RAINBOW_RED,
           RAINBOW_ORANGE,
           RAINBOW_YELLOW,
           RAINBOW_GREEN,
           RAINBOW_BLUE,
           RAINBOW_VIOLET )
end
alias_method :pride, :rainbow


  end  # class Image
end   # module Pixelart
