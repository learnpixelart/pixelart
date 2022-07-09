module Pixelart


class Palette8bit     # or use Palette256 alias?
                      ##  todo/check: change class Palette8Bit to Module (like Class) - why? why not?

  ## auto-add grayscale 0 to 255
  ##  e.g. rgb(0,0,0)
  ##       rgb(1,1,1)
  ##       rgb(2,2,2)
  ##       ...
  ##       rgb(255,255,255)
  GRAYSCALE = (0..255).map { |n| Color.rgb( n, n, n ) }


   ## 8x32 gradient color stops
   ##   see https://en.wikipedia.org/wiki/List_of_software_palettes#Color_gradient_palettes

  SEPIA_STOPS = [
    ['080400', '262117'],
    ['272218', '453E2F'],
    ['463F30', '645C48'],
    ['655D48', '837A60'],

    ['847A60', 'A29778'],
    ['A39878', 'C1B590'],
    ['C2B691', 'E0D2A8'],
    ['E1D3A9', 'FEEFBF'],
  ]

  BLUE_STOPS = [
    ['000000', '001F3E'],
    ['002040', '003F7E'],
    ['004080', '005FBD'],
    ['0060BF', '007FFD'],

    ['0080FF', '009FFF'],
    ['00A0FF', '00BFFF'],
    ['00C0FF', '00DFFF'],
    ['00E0FF', '00FEFF'],
  ]

  FALSE_STOPS = [
    ['FF00FF', '6400FF'],
    ['5F00FF', '003CFF'],
    ['0041FF', '00DCFF'],
    ['00E1FF', '00FF82'],

    ['00FF7D', '1EFF00'],
    ['23FF00', 'BEFF00'],
    ['C3FF00', 'FFA000'],
    ['FF9B00', 'FF0000'],
  ]


  def self.build_palette( gradients )
    colors_per_gradient, mod = 256.divmod( gradients.size )
    raise ArgumentError, "8bit palette - 256 must be divisible by # of gradients (#{gradients.size}; expected mod of 0 but got #{mod}"   if mod != 0

    colors = []
    gradients.each do |stops|
      colors += Gradient.new( *stops ).colors( colors_per_gradient )
    end
    colors
  end

  SEPIA     = build_palette( SEPIA_STOPS )
  BLUE      = build_palette( BLUE_STOPS )
  FALSE     = build_palette( FALSE_STOPS )
end  # class Palette8bit
end # module Pixelart

