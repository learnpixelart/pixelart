module Pixelart


class ImagePalette8bit < Image  # or use Palette256 alias?
  def initialize( colors, size: 1, spacing: nil )
    ## todo/check: change size arg to pixel or such? better name/less confusing - why? why not?

    ## todo/check: assert colors MUST have 256 colors!!!!

    ## use a "smart" default if no spacing set
    ##   0 for for (pixel) size == 1
    ##   1 for the rest
    spacing = size == 1 ? 0 : 1  if spacing.nil?

    img = ChunkyPNG::Image.new( 32*size+(32-1)*spacing,
                                 8*size+(8-1)*spacing )

    colors.each_with_index do |color,i|
      y,x = i.divmod( 32 )
      if size > 1
        size.times do |n|
          size.times do |m|
            img[ x*size+n+spacing*x,
                 y*size+m+spacing*y] = color
          end
        end
      else
        img[x,y] = color
      end
    end

    super( img.width, img.height, img )
  end
end # class ImagePalette8bit
end # module Pixelart


