require 'pixelart/base'

module Glimmer
  module Pixelart
    class Element
      class Canvas < Element
        attr_reader :vector
        attr_accessor :file
        
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
        
        def post_add_content
          build
        end
      
        def build
          @vector = ::PixelArt::Vector.new(*@args)
          super
          @vector.save(@file) if @file
        end
        
        def respond_to?(method_name, include_private = true)
          super || @vector.respond_to?(method_name, include_private)
        end
        
        def method_missing(method_name, *args, **kwargs, &block)
          if @vector.respond_to?(method_name, true)
            @vector.send(method_name, *args, **kwargs, &block)
          else
            super
          end
        end
      end
    end
  end
end
