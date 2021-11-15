require 'glimmer/dsl/engine'
Dir[File.expand_path('*_expression.rb', __dir__)].each {|f| require f}

module Glimmer
  module DSL
    module Pixelart
      Engine.add_dynamic_expressions(
        Pixelart,
        %w[
          attribute
          element
        ]
      )
    end
  end
end
