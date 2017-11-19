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

      def self.compile(ast)
        case ast
        when Beryl::Syntax::Integer
          org.jruby.ast.FixnumNode.new(noposition, ast.value)
        else
          raise Beryl::Error, "unsupported syntax: #{ast.class}"
        end
      end
    end
  end
end
