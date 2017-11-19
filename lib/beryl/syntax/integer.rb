# frozen_string_literal: true

module Beryl
  module Syntax
    # Integer behavior definition
    class Integer < Literal
      def initialize(value)
        super(value.to_i)
      end
    end
  end
end
