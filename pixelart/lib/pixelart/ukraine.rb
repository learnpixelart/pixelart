#######
#
#  Glory To Ukraine! Fuck (Vladimir) Putin! Stop the War!
#   Send A Stop The War Message To The World With Your Pixel Art Images
#


module Pixelart

class Image
  def ukraine
    ### move colors to (reusable) constants e.g.
    ###   UKRAINE_BLUE
    ###   UKRAINE_YELLOW  - why? why not?
    ukraine_blue   = Color.parse( '#0057b7' )
    ukraine_yellow = Color.parse( '#ffdd00' )

    img = Image.new( @img.width, @img.height )

    @img.height.times do |y|
      color = (y < @img.height/2) ? ukraine_blue : ukraine_yellow
      @img.width.times do |x|
        img[x,y] = color
      end
    end

    img.compose!( self )  ## paste/compose image onto backgorund
    img
  end
end  # class Image

end # module Pixelart

