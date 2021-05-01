# Notes

## Todos

check if these moved over color helpers
are already covered:

```
class Color     ## convenience helper to "abstract" ChunkyPNG usage away in "outside" (not internal) sample code
  def self.to_hex(color, include_alpha: false)
    if include_alpha
      '#%08x' % color
    else
      '#%06x' % [color >> 8]
    end
  end

  def self.rgb_to_hsl( r, g, b )
    rgb = ChunkyPNG::Color.rgb( r, g, b )
    hsl = ChunkyPNG::Color.to_hsl( rgb )
    hsl
  end

  def self.from_hsl( h, s, l )
    ChunkyPNG::Color.from_hsl( h, s, l )
  end
end  # class Color
```


## Ascii Art - Image Chars

```
@image_chars ||= ' .~:+=o*x^%#@'.chars.to_a
```
source: <https://github.com/vaithak/fictionArt/blob/master/lib/fictionArt.rb>









