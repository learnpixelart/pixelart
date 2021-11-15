module Glimmer
  module Pixelart
    class Element
      class Circle < Element
        attr_accessor :fill
        
        def cx
          @args[0]
        end
        alias center_x cx
      
        def cy
          @args[1]
        end
        alias center_y cy
      
        def r
          @args[2]
        end
        alias radius r
      
        def cx=(new_cx)
          @args[0] = new_cx
        end
        alias center_x cx
      
        def cy=(new_cy)
          @args[1] = new_cy
        end
        alias center_y cy
      
        def r=(new_r)
          @args[2] = new_r
        end
        alias radius r
      
        def build
          @parent.circle(cx: cx, cy: cy, r: r, fill: @fill)
        end
      end
    end
  end
end
