module Pixelart


## todo/check:
##   use a different name for silhouette
##    - why not  - outline ???
##           or  - shadow  ???
##           or  - profile ???
##           or  - figure  ???
##           or  - shape   ???
##           or  - form    ???

class Image
  def silhouette( color='#000000' )
    color = Color.parse( color )

    img = Image.new( @img.width, @img.height )

    @img.width.times do |x|
      @img.height.times do |y|
        pixel = @img[x,y]

        img[x,y] = if pixel == Color::TRANSPARENT  # transparent (0)
                       Color::TRANSPARENT
                   else
                       color
                   end
    end
  end
  img
end

end  # class Image

end # module Pixelart
