# frozen_string_literal: true

module Beryl
  class Parser < Parslet::Parser
    # Transformation rules from low-level parser output
    # to high-level syntax object
    class Transformer < Parslet::Transform
      rule integer: simple(:integer) do
        Beryl::Syntax::Integer.new(integer)
      end
    end
  end
end
