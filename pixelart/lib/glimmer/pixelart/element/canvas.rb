require 'pixelart/base'

module Glimmer
  module Pixelart
    class Element
      class Canvas < Element
        attr_reader :vector
        attr_accessor :file, :zoom
        
        def width
          @args[0]
        end
      
        def height
          @args[1]
        end
      
        def width=(new_width)
          @args[0] = new_width
        end
      
        def height=(new_height)
          @args[1] = new_height
        end
      
        def build
          @vector = ::PixelArt::Vector.new(*@args)
          @vector.zoom(@zoom) if @zoom
          @vector.save(@file) if @file
        end
        
        def respond_to?(method_name, include_private = false)
          super || @vector.respond_to?(method_name, include_private)
        end
        
        def method_missing(method_name, *args, &block)
          if @vector.respond_to?(method_name, include_private)
            @vector.send(method_name, *args, &block)
          else
            super
          end
        end
      end
    end
  end
end
