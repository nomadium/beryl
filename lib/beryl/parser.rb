# frozen_string_literal: true

require "parslet"
require_relative "parser/transformer"

module Beryl
  # Beryl syntax definition
  class Parser < Parslet::Parser
    rule(:integer) do
      space? >> match("[0-9]").repeat(1).as(:int) >> space?
    end

    rule(:space) do
      match("\s").repeat(1)
    end

    rule(:space?) do
      space.maybe
    end

    rule(:operator) do
      match("[+]")
    end

    rule(:sum) do
      integer.as(:left) >> operator.as(:op) >> expression.as(:right)
    end

    rule(:letter) do
      match("[A-Za-z]")
    end

    rule(:string) do
      str("'") >> (str("''") | str("'").absent? >> any).repeat.as(:string) >>
        str("'")
    end

    rule(:identifier) do
      letter >> (letter | integer | str("_")).repeat
    end

    rule(:message) do
      identifier.as(:receiver) >> space >> identifier.as(:msg) >> str(":") >>
        space >> (integer | string).as(:arg)
    end

    rule(:expression) do
      sum | integer | message
    end

    root(:expression)

    def initialize
      @transformer = Transformer.new
    end

    def parse(str)
      @transformer.apply(root.parse(str))
    rescue Parslet::ParseFailed => e
      # to-do: expose more info from the original exception
      raise Beryl::Error, e.message
    end
  end
end
