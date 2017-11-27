# frozen_string_literal: true

module Beryl
  module Syntax
    # Constant behavior definition
    class Constant < Node
      def initialize(name)
        @name = name.to_s
      end
      attr_reader :name

      def jruby_compile
        noposition = Beryl::Compiler::Jruby.noposition
        org.jruby.ast.ConstNode.new(noposition, name)
      end
    end
  end
end
