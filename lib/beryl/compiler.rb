# frozen_string_literal: true

require_relative "compiler/jruby"

module Beryl
  # Anything related to Beryl compilation resides here
  class Compiler
    def initialize(backend: :jruby)
      @backend = backend
    end
    attr_reader :backend
    def compile(ast)
      case @backend
      when :jruby
        Beryl::Compiler::Jruby.compile(ast)
      else
        raise Beryl::Error, "Unsupported compilation backend: #{@backend}"
      end
    end
  end
end
