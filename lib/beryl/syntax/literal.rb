# frozen_string_literal: true

module Beryl
  module Syntax
    # Behavior definition common to all Beryl syntax literal elements
    class Literal < Node
      def initialize(value)
        @value = value
      end
      attr_accessor :value
    end
  end
end
