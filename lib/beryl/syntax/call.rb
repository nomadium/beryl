# frozen_string_literal: true

module Beryl
  module Syntax
    # Method call behavior definition
    class Call < Node
      def initialize(name, receiver:, args:)
        @name     = name.to_s
        @receiver = receiver
        @args     = args
      end
      attr_reader :name, :receiver, :args

      def jruby_compile
        noposition = Beryl::Compiler::Jruby.noposition
        org.jruby.ast.CallNode.new(
          noposition,
          receiver.compile,
          name,
          _jruby_array_node,
          nil
        )
      end

      private

      def _jruby_array_node
        noposition = Beryl::Compiler::Jruby.noposition
        org.jruby.ast.ArrayNode.new(
          noposition,
          args.first.compile
        )
      end
    end
  end
end
