module Pixelart



class Image
  def sketch( sketch=4, line: 1,
                        line_color: Color::BLACK,
                        colorize: false )
      ## todo/check: rename color option to fill or such - why? why not?

       # todo: line - find a better name eg. line_strenght/width or such?
      width  = @img.width*sketch  + (@img.width+1)*line
      height = @img.height*sketch + (@img.height+1)*line

      puts "  #{width}x#{height}"


      background_color = colorize ? Color::TRANSPARENT
                                  : Color::WHITE


      img = Image.new( width, height, background_color )


      @img.width.times do |x|
        @img.height.times do |y|
          pixel = @img[x,y]

          ## get surrounding pixels - if "out-of-bound" use transparent (0)
          left   =  x == 0  ? Color::TRANSPARENT : @img[x-1,y]
          top    =  y == 0  ? Color::TRANSPARENT : @img[x  ,y-1]
          diag   =  (x==0 || y== 0) ? Color::TRANSPARENT : @img[x-1,y-1]

          if pixel != left   ## draw vertical line
            line.times do |n|
              (sketch+line*2).times do |m|
                  img[    x*sketch + line*x + n,
                      m + y*sketch + line*y] = line_color
                end
              end
          end

          if pixel != top   ## draw horizontal line
             (sketch+line*2).times do |n|
               line.times do |m|
                 img[n + x*sketch + line*x,
                         y*sketch + line*y + m] = line_color
                end
             end
          end


          ## check special edge case for x and y to add "finish-up" right and bottom line
          if x == @img.width-1 && pixel != Color::TRANSPARENT
             ## draw vertical line
             line.times do |n|
              (sketch+line*2).times do |m|
                img[    (x+1)*sketch + line*(x+1) + n,
                    m + y*sketch + line*y] = line_color
              end
             end
          end

          if y== @img.height-1 && pixel != Color::TRANSPARENT
            ## draw horizontal line
            (sketch+line*2).times do |n|
              line.times do |m|
                img[n + x*sketch + line*x,
                        (y+1)*sketch + line*(y+1) + m] = line_color
              end
            end
          end

          ###############
          ## fill with pixel color if color true (default is false)
          if colorize && pixel != Color::TRANSPARENT
            sketch.times do |n|
              sketch.times do |m|
                img[x*sketch + line*(x+1) + n,
                    y*sketch + line*(y+1) + m] = pixel
              end
            end

            if pixel == left   ## draw vertical line
              line.times do |n|
                sketch.times do |m|
                  img[x*sketch + line*x + n,
                      y*sketch + line*(y+1) + m]  = pixel
                      # (y%2==0 ? 0x0000ffff : 0x000088ff )  # (for debugging)
                end
              end
            end

            if pixel == top   ## draw horizontal line
              sketch.times do |n|
                line.times do |m|
                  img[x*sketch + line*(x+1) + n,
                      y*sketch + line*y + m]   = pixel
                      # (x%2==0 ? 0xff0000ff : 0x880000ff ) # (for debugging)
                 end
              end
           end

           ## check all four same color (00,01)
           ##                           (10, x)  - bingo!
           if pixel == left && pixel == top && pixel == diag
              line.times do |n|
                line.times do |m|
                  img[x*sketch + line*x + n,
                      y*sketch + line*y + m]  = pixel
                  # 0xffff00ff  # (for debugging)
                 end
              end
           end
          end  # colorize?

        end #  height.times
      end   #  width.times

      img
  end
end # class Image
end # module Pixelart

