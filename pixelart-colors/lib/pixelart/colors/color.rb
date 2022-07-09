module Pixelart


class Color       ## todo/check - change class to module Color - why? why not?

  TRANSPARENT = 0            # rgba(  0,   0,   0,   0)
  BLACK       = 0xff         # rgba(  0,   0,   0, 255)
  WHITE       = 0xffffffff   # rgba(255, 255, 255, 255)


  def self.parse( color )
    if color.is_a?( Integer )  ## e.g. assumes rgba or such
      color ## pass through as is 1:1
    elsif color.is_a?( Array )  ## assume array of hsl(a) e. g. [180, 0.86, 0.88]
      from_hsl( *color )
    elsif color.is_a?( String )
      if color.downcase == 'transparent'   ## special case for builtin colors
        TRANSPARENT
      else
        ## note: return an Integer !!! (not a Color class or such!!! )
        from_hex( color )
      end
    else
      raise ArgumentError, "unknown color format; cannot parse - expected rgb hex string e.g. d3d3d3"
    end
  end


    # Creates a new color using an r, g, b triple and an alpha value.
    # @param [Integer] r The r-component (0-255)
    # @param [Integer] g The g-component (0-255)
    # @param [Integer] b The b-component (0-255)
    # @param [Integer] a The opacity (0-255)
    # @return [Integer] The newly constructed color value.
    def self.rgba(r, g, b, a)
      r << 24 | g << 16 | b << 8 | a
    end

    # Creates a new color using an r, g, b triple.
    # @param [Integer] r The r-component (0-255)
    # @param [Integer] g The g-component (0-255)
    # @param [Integer] b The b-component (0-255)
    # @return [Integer] The newly constructed color value.
    def self.rgb(r, g, b)
      r << 24 | g << 16 | b << 8 | 0xff
    end


    # Returns the red-component from the color value.
    #
    # @param [Integer] value The color value.
    # @return [Integer] A value between 0 and MAX.
    def self.r(value)
      (value & 0xff000000) >> 24
    end

    # Returns the green-component from the color value.
    #
    # @param [Integer] value The color value.
    # @return [Integer] A value between 0 and MAX.
    def self.g(value)
      (value & 0x00ff0000) >> 16
    end

    # Returns the blue-component from the color value.
    #
    # @param [Integer] value The color value.
    # @return [Integer] A value between 0 and MAX.
    def self.b(value)
      (value & 0x0000ff00) >> 8
    end

    # Returns the alpha channel value for the color value.
    #
    # @param [Integer] value The color value.
    # @return [Integer] A value between 0 and MAX.
    def self.a(value)
      value & 0x000000ff
    end




    # Returns true if this color is fully opaque.
    #
    # @param [Integer] value The color to test.
    # @return [true, false] True if the alpha channel equals MAX.
    def self.opaque?(value)
      a(value) == 0x000000ff
    end

    # Returns true if this color is fully transparent.
    #
    # @param [Integer] value The color to test.
    # @return [true, false] True if the r, g and b component are equal.
    def self.grayscale?(value)
      r(value) == b(value) && b(value) == g(value)
    end

    # Returns true if this color is fully transparent.
    #
    # @param [Integer] value The color to test.
    # @return [true, false] True if the alpha channel equals 0.
    def self.transparent?(value)
      a(value) == 0x00000000
    end



  # The regexp to parse 3-digit hex color values.
  HEX3_COLOR_REGEXP  = /\A(?:#|0x)?([0-9a-f]{3})\z/i

  # The regexp to parse 6- and 8-digit hex color values.
  HEX6_COLOR_REGEXP  = /\A(?:#|0x)?([0-9a-f]{6})([0-9a-f]{2})?\z/i


  def self.from_hex( hex_str )
    ## Creates a color by converting it from a string in hex notation.
    ##
    ## It supports colors with (#rrggbbaa) or without (#rrggbb)
    ##  alpha channel as well as the 3-digit short format (#rgb)
    ## for those without. Color strings may include
    ## the prefix "0x" or "#"".
    base_color = case hex_str
                 when HEX3_COLOR_REGEXP
                   $1.gsub( /([0-9a-f])/i, '\1\1' ).hex << 8
                 when HEX6_COLOR_REGEXP
                   $1.hex << 8
                 else
                   raise ArgumentError, "Not a valid hex color notation: #{hex_str.inspect}!"
                 end
    opacity = $2 ? $2.hex : 0xff
    base_color | opacity
  end

    # Returns a string representing this color using hex notation (i.e.
    # #rrggbbaa).
    #
    # @param [Integer] color The color to convert.
    # @param [Boolean] include_alpha
    # @return [String] The color in hex notation, starting with a pound sign.
  def self.to_hex( color, include_alpha: true )
      include_alpha ? ("#%08x" % color) : ("#%06x" % [color >> 8])
  end



    # Creates a new color from an HSL triple.
    #
    # This implementation follows the modern convention of 0 degrees hue
    # indicating red.
    #
    # @param [Fixnum] hue The hue component (0-360)
    # @param [Fixnum] saturation The saturation component (0-1)
    # @param [Fixnum] lightness The lightness component (0-1)
    # @param [Fixnum] alpha Defaults to opaque (255).
    # @return [Integer] The newly constructed color value.
    # @raise [ArgumentError] if the hsl triple is invalid.
    # @see https://en.wikipedia.org/wiki/HSL_and_HSV

  def self.from_hsl( hue, saturation, lightness, alpha=255)
      raise ArgumentError, "Hue #{hue} was not between 0 and 360" unless (0..360).cover?(hue)
      raise ArgumentError, "Saturation #{saturation} was not between 0 and 1" unless (0..1).cover?(saturation)
      raise ArgumentError, "Lightness #{lightness} was not between 0 and 1" unless (0..1).cover?(lightness)

      chroma = (1 - (2 * lightness - 1).abs) * saturation
      rgb    = cylindrical_to_cubic(hue, saturation, lightness, chroma)
      rgb.map! { |component| ((component + lightness - 0.5 * chroma) * 255).to_i }
      rgb << alpha
      rgba(*rgb)
  end

    # Creates a new color from an HSV triple.
    #
    # Create a new color using an HSV (sometimes also called HSB) triple. The
    # words `value` and `brightness` are used interchangeably and synonymously
    # in descriptions of this colorspace. This implementation follows the modern
    # convention of 0 degrees hue indicating red.
    #
    # @param [Fixnum] hue The hue component (0-360)
    # @param [Fixnum] saturation The saturation component (0-1)
    # @param [Fixnum] value The value (brightness) component (0-1)
    # @param [Fixnum] alpha Defaults to opaque (255).
    # @return [Integer] The newly constructed color value.
    # @raise [ArgumentError] if the hsv triple is invalid.
    # @see https://en.wikipedia.org/wiki/HSL_and_HSV
  def self.from_hsv(hue, saturation, value, alpha=255)
      raise ArgumentError, "Hue must be between 0 and 360" unless (0..360).cover?(hue)
      raise ArgumentError, "Saturation must be between 0 and 1" unless (0..1).cover?(saturation)
      raise ArgumentError, "Value/brightness must be between 0 and 1" unless (0..1).cover?(value)

      chroma = value * saturation
      rgb    = cylindrical_to_cubic(hue, saturation, value, chroma)
      rgb.map! { |component| ((component + value - chroma) * 255).to_i }
      rgb << alpha
      rgba(*rgb)
    end

    # Convert one HSL or HSV triple and associated chroma to a scaled rgb triple
    #
    # This method encapsulates the shared mathematical operations needed to
    # convert coordinates from a cylindrical colorspace such as HSL or HSV into
    # coordinates of the RGB colorspace.
    #
    # Even though chroma values are derived from the other three coordinates,
    # the formula for calculating chroma differs for each colorspace.  Since it
    # is calculated differently for each colorspace, it must be passed in as
    # a parameter.
    #
    # @param [Fixnum] hue The hue-component (0-360)
    # @param [Fixnum] saturation The saturation-component (0-1)
    # @param [Fixnum] y_component The y_component can represent either lightness
    #     or brightness/value (0-1) depending on which scheme (HSV/HSL) is being used.
    # @param [Fixnum] chroma The associated chroma value.
    # @return [Array<Fixnum>] A scaled r,g,b triple. Scheme-dependent
    #    adjustments are still needed to reach the true r,g,b values.
    # @see https://en.wikipedia.org/wiki/HSL_and_HSV
    def self.cylindrical_to_cubic(hue, saturation, y_component, chroma)
      hue_prime = hue.fdiv(60)
      x = chroma * (1 - (hue_prime % 2 - 1).abs)

      case hue_prime
      when (0...1) then [chroma, x, 0]
      when (1...2) then [x, chroma, 0]
      when (2...3) then [0, chroma, x]
      when (3...4) then [0, x, chroma]
      when (4...5) then [x, 0, chroma]
      when (5..6)  then [chroma, 0, x]
      end
    end



  # Returns an array with the separate HSL components of a color.
    #
    # Note: Because this code internally handles colors as Integers for performance
    # reasons, some rounding  occurs when importing or exporting HSL colors
    # whose coordinates are float-based.  Because of this rounding, #to_hsl and
    # #from_hsl may not be perfect inverses.
    #
    # This implementation follows the modern convention of 0 degrees hue indicating red.
    #
    # @param [Integer] color The color to convert.
    # @param [Boolean] include_alpha Flag indicates whether a fourth element
    #     representing alpha channel should be included in the returned array.
    # @return [Array<Fixnum>[0]] The hue of the color (0-360)
    # @return [Array<Fixnum>[1]] The saturation of the color (0-1)
    # @return [Array<Fixnum>[2]] The lightness of the color (0-1)
    # @return [Array<Fixnum>[3]] Optional fourth element for alpha, included if
    #     include_alpha=true (0-255)
    # @see https://en.wikipedia.org/wiki/HSL_and_HSV
    def self.to_hsl(color, include_alpha: true )
      hue, chroma, max, min = hue_and_chroma(color)
      lightness  = 0.5 * (max + min)
      saturation = chroma.zero? ? 0.0 : chroma.fdiv(1 - (2 * lightness - 1).abs)

      include_alpha ? [hue, saturation, lightness, a(color)] :
                      [hue, saturation, lightness]
    end

    # Returns an array with the separate HSV components of a color.
    #
    # Note: Because this code internally handles colors as Integers for performance
    # reasons, some rounding  occurs when importing or exporting HSV colors
    # whose coordinates are float-based.  Because of this rounding, #to_hsv and
    # #from_hsv may not be perfect inverses.
    #
    # This implementation follows the modern convention of 0 degrees hue
    # indicating red.
    #
    # @param [Integer] color
    # @param [Boolean] include_alpha Flag indicates whether a fourth element
    #    representing alpha channel should be included in the returned array.
    # @return [Array[0]] The hue of the color (0-360)
    # @return [Array[1]] The saturation of the color (0-1)
    # @return [Array[2]] The value of the color (0-1)
    # @return [Array[3]] Optional fourth element for alpha, included if
    #    include_alpha=true (0-255)
    # @see https://en.wikipedia.org/wiki/HSL_and_HSV
    def self.to_hsv(color, include_alpha: true )
      hue, chroma, max, _ = hue_and_chroma(color)
      value      = max
      saturation = chroma.zero? ? 0.0 : chroma.fdiv(value)

      include_alpha ? [hue, saturation, value, a(color)] :
                      [hue, saturation, value]
    end



    # This method encapsulates the logic needed to extract hue and chroma from
    # a color. This logic is shared by the cylindrical HSV/HSB and HSL
    # color space models.
    #
    # @param [Integer] color.
    # @return [Fixnum] hue The hue of the color (0-360)
    # @return [Fixnum] chroma The chroma of the color (0-1)
    # @return [Fixnum] max The magnitude of the largest scaled rgb component (0-1)
    # @return [Fixnum] min The magnitude of the smallest scaled rgb component (0-1)
    # @private
    def self.hue_and_chroma(color)
      scaled_rgb = [r(color), g(color), b(color)]
      scaled_rgb.map! { |component| component.fdiv(255) }
      min, max = scaled_rgb.minmax
      chroma   = max - min

      r, g, b   = scaled_rgb
      hue_prime = chroma.zero? ? 0 : case max
                                     when r then (g - b).fdiv(chroma)
                                     when g then (b - r).fdiv(chroma) + 2
                                     when b then (r - g).fdiv(chroma) + 4
                                     else 0
                                     end
      hue = 60 * hue_prime

      [hue.round, chroma, max, min]
    end
end  # class Color
end  # module Pixelart


