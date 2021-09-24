module Pixelart

class Image


def spots( spot=10,
              spacing: 0,
              center: nil,
              radius: nil,
              background: nil,
              lightness: nil,
              odd: false )

  width  = @img.width
  height = @img.height
  ## puts "  #{width}x#{height}"

  min_center, max_center = center ? center : [0,0]
  min_radius, max_radius = radius ? radius : [0,0]

  background_color = background ? Color.parse( background ) : 0

  min_lightness, max_lightness = lightness ? lightness : [0.0,0.0]

  ## note: magick command line might get way too long, thus,
  ##   save commands to a script
  script = String.new('')
  script << "#{MAGICK_INPUT} \\\n"


    width.times do |x|
      height.times do |y|
         color = @img[ x, y ]

         if color == 0  ## transparent
           if background   ## change transparent to background
              color = background_color
           else
             next ## skip transparent
           end
         end


         if lightness
          ## todo/check: make it work with alpha too
          h,s,l = Color.to_hsl( color, include_alpha: false )

           h = h % 360    ## make sure h(ue) is always positive!!!

           ## note: rand() return between 0.0 and 1.0
           l_diff = min_lightness +
                     (max_lightness-min_lightness)*rand()

           lnew = [1.0, l+l_diff].min
           lnew = [0.0, lnew].max

           ## print " #{l}+#{l_diff}=#{lnew} "

           color = Color.from_hsl( h,
                                   [1.0, s].min,
                                   lnew )
         end

         ## note: return hexstring with leading #
         # e.g.    0 becomes #00000000
         #        and so on
         color_hex = Color.to_hex( color, include_alpha: true )
         script << "-fill '#{color_hex}' "

         cx_offset,
         cy_offset = if center  ## randomize (offset off center +/-)
                       [(spot/2 + min_center) + rand( max_center-min_center ),
                        (spot/2 + min_center) + rand( max_center-min_center )]
                     else
                       [spot/2,   ## center
                        spot/2]
                     end

         cx = x*spot + x*spacing + cx_offset
         cy = y*spot + y*spacing + cx_offset

         px_offset = if radius ## randomize (radius +/-)
                       min_radius + rand( max_radius-min_radius )
                     else
                       spot/2
                     end
         px = cx + px_offset
         py = cy


         if odd && (y % 2 == 1)  ## add odd offset
            cx += spot/2
            px += spot/2
         end

         ## circle
         ##  give the center and any point on the perimeter (boundary)
         script << "-draw 'circle #{cx},#{cy},#{px},#{py}' \\\n"
      end
    end

    script << "-write #{MAGICK_OUTPUT}\n"


    ## use an empty image (canvas) with transparent background
    ##   as magick input image
   canvas = Image.new( width*spot+(width-1)*spacing,
                       height*spot+(height-1)*spacing )
   canvas.save( MAGICK_INPUT )

   ## note: save magick input first (see above) before save script
   ##        will (auto-)create missing directories in path (if missing)

   File.open( MAGICK_SCRIPT, 'w:utf-8' ) do |f|
     f.write( script )
   end


  MiniMagick::Tool::Magick.new do |magick|
    magick.script( MAGICK_SCRIPT )
  end

  Image.read( MAGICK_OUTPUT )
end


end # class Image
end # class Pixelart

