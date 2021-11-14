require 'glimmer/dsl/expression'

module Glimmer
  module DSL
    module Pixelart
      class AttributeExpression < Expression
        def can_interpret?(parent, keyword, *args, &block)
          parent.respond_to?("#{keyword}=") && !args.empty? && block.nil?
        end
        
        def interpret(parent, keyword, *args, &block)
          parent.send("#{keyword}=", *args)
        end
      end
    end
  end
end
