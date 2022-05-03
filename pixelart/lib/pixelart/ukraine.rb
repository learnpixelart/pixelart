#######
#
#  Glory To Ukraine! Fuck (Vladimir) Putin! Stop the War!
#   Send A Stop The War Message To The World With Your Pixel Art Images
#


module Pixelart

class Image

  ### todo/check: move colors to (reusable) constants int Color !!!! why? why not?
  UKRAINE_BLUE   = Color.parse( '#0057b7' )
  UKRAINE_YELLOW = Color.parse( '#ffdd00' )

  def ukraine() stripes( UKRAINE_BLUE, UKRAINE_YELLOW ); end
end  # class Image

end # module Pixelart

