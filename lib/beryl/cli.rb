# frozen_string_literal: true

require "thor"

module Beryl
  # Beryl command line driver
  class CLI < Thor
    map %w[-e --expression] => :evaluate
    desc "-e, --expression COMMAND", "Evaluate Beryl expression"
    def evaluate(expr)
      Beryl::Runner.run(expression: expr)
    end

    map %w[-r --run] => :execute
    desc "-r, --run PROGRAM_FILE", "Execute Beryl program"
    def execute(file_name)
      Beryl::Runner.run(file: file_name)
    end
  end
end
