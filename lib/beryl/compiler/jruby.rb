# frozen_string_literal: true

require "jruby"

module Beryl
  class Compiler
    # JRuby compilation backend
    module Jruby
      def self.noposition
        org.jruby.lexer.yacc.SimpleSourcePosition.new("/dev/null", 0)
      end

      def self.compile(ast, context:)
        org.jruby.ast.RootNode.new(
          noposition,
          context[:scope],
          ast.compile,
          "(none)"
        )
      end
    end
  end
end
