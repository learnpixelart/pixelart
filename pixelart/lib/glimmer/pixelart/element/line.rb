module Glimmer
  module Pixelart
    class Element
      class Line < Element
        attr_accessor :fill, :stroke
        
        def coordinates
          @args
        end
      
        def coordinates=(*new_coordinates)
          new_coordinates = new_coordinates.first if new_coordinates.size == 1 && new_coordinates.first.is_a?(Array)
          @args = *new_coordinates
        end
      
        def build
          @parent.path(stroke: @stroke, fill: @fill).line(*coordinates)
        end
      end
    end
  end
end
