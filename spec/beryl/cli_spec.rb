# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::CLI do
  subject(:cli) { described_class.new }

  describe "#evaluate" do
    it "returns the results of evaluating an expression" do
      expr        = double
      eval_result = double

      allow(Beryl::Runner)
        .to receive(:run).with(expression: expr).and_return(eval_result)

      expect(cli.evaluate(expr)).to eq(eval_result)
    end
  end

  describe "#execute" do
    it "returns the results of evaluating the program from a file" do
      file_name   = double
      exec_result = double

      allow(Beryl::Runner)
        .to receive(:run).with(file: file_name).and_return(exec_result)

      expect(cli.execute(file_name)).to eq(exec_result)
    end
  end

  describe "#repl" do
    it "returns the results of evaluating code from repl" do
      runner = double
      repl   = double

      allow(Beryl::Runner).to receive(:new).and_return runner
      allow(runner).to receive(:repl).and_return repl

      expect(cli.repl).to eq(repl)
    end
  end
end
