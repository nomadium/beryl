# frozen_string_literal: true

module Beryl
  module Syntax
    # Method call behavior definition
    class Call < Node
      def initialize(name, receiver:, args:)
        @name     = name
        @receiver = receiver
        @args     = args
      end
      attr_reader :name, :receiver, :args

      def compile(back_end: DEFAULT_BACK_END)
        case back_end
        when :jruby
          jruby_compile
        else
          raise Beryl::Error,
                "#{back_end} is not a supported compilation back end"
        end
      end

      def jruby_compile
        noposition = Beryl::Compiler::Jruby.noposition
        org.jruby.ast.CallNode.new(
          noposition,
          Beryl::Compiler::Jruby.send(:_compile, receiver),
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
          Beryl::Compiler::Jruby.send(:_compile, args.first)
        )
      end
    end
  end
end
