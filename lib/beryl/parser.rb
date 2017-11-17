# frozen_string_literal: true

require "parslet"

module Beryl
  # Beryl syntax definition
  class Parser < Parslet::Parser
    rule(:integer) { match("[0-9]").repeat(1).as(:integer) }
    def parse(str)
      integer.parse(str)
    rescue Parslet::ParseFailed => e
      # to-do: expose more info from the original exception
      raise Beryl::Error, e.message
    end
  end
end
