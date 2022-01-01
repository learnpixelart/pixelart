
module Pixelart
class Image

  def transparent( style = :solid, fuzzy: false )
    img = Image.new( width, height )


    background = self[0,0]

    bh,bs,bl =  Color.to_hsl( background )
    bh = (bh % 360)  ## might might negative degree (always make positive)

    height.times do |y|
        if style == :linear
          background = self[0,y]

          bh,bs,bl =  Color.to_hsl( background )
          bh = (bh % 360)  ## might might negative degree (always make positive)
        end
      width.times do |x|
        pixel = self[x,y]

        if background == 0  ## special case if background is already transparent keep going
          img[x,y] =  pixel
        elsif fuzzy
          ## check for more transparents
            ##   not s  is 0.0 to 0.99  (100%)
            ##   and l  is 0.0 to 0.99  (100%)
          h,s,l =  Color.to_hsl( pixel )
          h = (h % 360)  ## might might negative degree (always make positive)

          ## try some kind-of fuzzy "heuristic" match on background color
          if ((h >= bh-5) && (h <= bh+5)) &&
             ((s >= bs-0.07) && (s <= bs+0.07)) &&
             ((l >= bl-0.07) && (l <= bl+0.07))
           img[x,y] = 0  ## Color::TRANSPARENT

           if h != bh || s != bs || l != bl
              # report fuzzy background color
              puts "  #{x}/#{y} fuzzy background #{[h,s,l]} ~= #{[bh,bs,bl]}"
           end
          else
            img[x,y] =  pixel
          end
        else
           if pixel == background
            img[x,y] = 0   ## Color::TRANSPARENT
           else
             img[x,y] =  pixel
           end
        end
      end
    end
    img
  end # method transparent


end   # class Image
end  # module Pixelart
