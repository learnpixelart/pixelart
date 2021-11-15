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
      
      attr_reader :parent, :keyword, :args, :block
    
      def initialize(parent, keyword, *args, &block)
        @parent = parent
        @keyword = keyword
        @args = args
        @block = block
        @children = []
        @parent&.post_initialize_child(self)
        post_add_content if @block.nil?
      end
      
      # Subclasses may optionally override and call super to have children built
      def build
        @children&.each(&:build)
      end
      
      def post_initialize_child(child)
        @children << child
      end
      
      def post_add_content
        # No Op (subclasses may override to do something at the closing of the element)
      end
      
      # Enables re-opening content and adding new shapes
      def content(&block)
        Glimmer::DSL::Engine.add_content(self, Glimmer::DSL::Pixelart::ElementExpression.new, @keyword, &block)
      end
    end
  end
end

Dir[File.expand_path('./element/*.rb', __dir__)].each {|f| require f}
