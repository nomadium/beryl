# frozen_string_literal: true

require "jruby"

module Beryl
  class Compiler
    # JRuby compilation backend
    module Jruby
      # should this be private or protected??
      def self.noposition
        org.jruby.lexer.yacc.SimpleSourcePosition.new("/dev/null", 0)
      end

      def self.compile(ast, context:)
        org.jruby.ast.RootNode.new(
          noposition,
          context[:scope],
          _compile(ast),
          "(none)"
        )
      end

      def self._compile(node)
        case node
        when Beryl::Syntax::Integer
          org.jruby.ast.FixnumNode.new(noposition, node.value)
        else
          raise Beryl::Error, "unsupported syntax: #{node.class}"
        end
      end
      private_class_method :_compile
    end
  end
end
