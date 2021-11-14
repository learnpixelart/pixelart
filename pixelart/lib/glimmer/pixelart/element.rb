require 'facets/string/camelcase'
  
module Glimmer
  module Pixelart
    class Element
      class << self
        def element_exist?(keyword)
          constants.include?(element_class_name(keyword)) && element_class(keyword).respond_to?(:new)
        end
      
        def element_class(keyword)
          const_get(element_class_name(keyword))
        end
        
        def element_class_name(keyword)
          keyword.to_s.camelcase(:upper).to_sym
        end
      end
    
      def initialize(parent, keyword, *args, &block)
        @parent = parent
        @keyword = keyword
        @args = args
        @block = block
        @children = []
        @parent&.post_initialize_child(self)
        post_add_content if @block.nil?
      end
      
      def build
        # No Op (subclasses may override to do something at the closing of the element)
      end
      
      def post_initialize_child(child)
        @children << child
      end
      
      # subclasses may optionally override and call super
      def post_add_content
        build
      end
    end
  end
end

Dir[File.expand_path('./element/*.rb', __dir__)].each {|f| require f}
