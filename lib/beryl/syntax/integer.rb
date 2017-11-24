# frozen_string_literal: true

module Beryl
  module Syntax
    # Integer behavior definition
    class Integer < Literal
      def initialize(value)
        super(value.to_i)
      end

      def jruby_compile
        noposition = Beryl::Compiler::Jruby.noposition
        org.jruby.ast.FixnumNode.new(noposition, value)
      end
    end
  end
end
