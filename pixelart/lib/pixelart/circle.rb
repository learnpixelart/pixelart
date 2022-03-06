###
#
#  add more circle aliases
#    e.g.  circular / round or such - why? why not?


module Pixelart

class Image
  def circle
    ### for radius use min of width / height
    r = [@img.width, @img.height].min / 2

    center_x = width  / 2
    center_y = height / 2

    ################
    #  try with 96x96
    #    center_x:  96 / 2 = 48
    #    center_y:  96 / 2 = 48
    #
    #     r:    96 / 2 = 48

    img = Image.new( @img.width, @img.height )

    @img.width.times do |x|
      @img.height.times do |y|

        ## change to float calcuation (instead of ints) - why? why not?
        xx, yy, rr = x - center_x,
                     y - center_y,
                     r

        img[ x, y] = if xx*xx+yy*yy < rr*rr
                           @img[ x, y ]
                     else
                           0  ## transparent - alpha(0)
                     end
      end
    end

    img
  end
end  # class Image

end # module Pixelart
