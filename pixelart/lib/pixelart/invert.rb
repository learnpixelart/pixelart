module Pixelart


## todo/check:
##   use a different name for invert
##    - why not  - negate ???


class Image
  ## note: invert will only invert r/g/b - and NOT the a(lpha) channel
  ##        the a(lpha) channel get passed on as is (1:1)
  def invert
    img = Image.new( @img.width, @img.height )

    @img.width.times do |x|
      @img.height.times do |y|
        pixel = @img[x,y]

        ## note: xor (^) with 0 returns the original value unmodified.
        ##       xor (^) with 0xff flips the bits.
        ##         that is we are flipping/inverting r, g and b.
        ##             and keep the a(lpha) channel as is.

        ## hack - why? why not?
        ##   if transparent e.g. 0x0 than keep as is
        ##                 do not use 0xffffff00  - makes a difference?

        img[x,y] = if pixel == Color::TRANSPARENT  # transparent (0)
                       Color::TRANSPARENT
                   else
                       pixel ^ 0xffffff00
                   end
    end
  end
  img
end

end  # class Image

end # module Pixelart
