# frozen_string_literal: true

require "parslet"
require_relative "parser/transformer"

module Beryl
  # Beryl syntax definition
  class Parser < Parslet::Parser
    rule(:integer) { match("[0-9]").repeat(1).as(:integer) }
    def initialize
      @transformer = Transformer.new
    end

    def parse(str)
      @transformer.apply(integer.parse(str))
    rescue Parslet::ParseFailed => e
      # to-do: expose more info from the original exception
      raise Beryl::Error, e.message
    end
  end
end
