# frozen_string_literal: true

module Beryl
  class Parser < Parslet::Parser
    # Transformation rules from low-level parser output
    # to high-level syntax object
    class Transformer < Parslet::Transform
      rule int: simple(:int) do
        Beryl::Syntax::Integer.new(int)
      end

      rule(left: simple(:left), op: "+", right: simple(:right)) do
        Beryl::Syntax::Call.new("+", receiver: left, args: [right])
      end
    end
  end
end
