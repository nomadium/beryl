# frozen_string_literal: true

require "thor"

module Beryl
  # Beryl command line driver
  class CLI < Thor
    map %w[-e --expression] => :evaluate
    desc "-e, --expression COMMAND", "Evaluate Beryl expression"
    def evaluate(expr)
      result = Beryl::Runner.run(expression: expr)
      puts "this is the result of the execution, not the output: #{result}"
      result
    end

    map %w[-r --run] => :execute
    desc "-r, --run PROGRAM_FILE", "Execute Beryl program"
    def execute(file_name)
      result = Beryl::Runner.run(file: file_name)
      puts "this is the result of the execution, not the output: #{result}"
      result
    end
  end
end
