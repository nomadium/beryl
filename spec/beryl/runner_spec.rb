# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Runner do
  subject(:runner) { described_class.new(args: {}, platform: :jruby) }

  describe "::run" do
    subject(:runner) { described_class }

    it "set up a runner and return its execution result" do
      example_runner = double
      result         = double

      allow(described_class).to receive(:new).and_return example_runner
      allow(example_runner).to  receive(:execute).and_return result

      expect(runner.run(args: {})).to eq(result)
    end
  end
  describe "#initialize" do
    subject(:runner) { described_class }

    context "when a unsupported platform is requested" do
      it "raises error" do
        expect { runner.new(platform: :foobar) }.to raise_error(Beryl::Error)
      end
    end
  end
  describe "#execute" do
    subject(:runner) do
      described_class.new(args: { expression: "0" }, platform: :jruby)
    end

    it "returns the result from runtime execution" do
      expect(runner.execute).to eq(0)
    end
  end
  describe "#repl" do
    it "returns the repl execution result" do
      repl_loop_result = double

      # rubocop:disable RSpec/SubjectStub
      allow(runner).to receive(:_repl_loop).and_return repl_loop_result

      expect(runner.repl).to eq(repl_loop_result)
    end
  end
  describe "#_run_bootstrap" do
    it "executes Ruby code to set up Beryl environment" do
      allow(IO).to receive(:read).and_return "42"
      expect(runner.send(:_run_bootstrap)).to eq(42)
    end
  end
  describe "#_execute" do
    it "returns the result from runtime execution" do
      expect(runner.send(:_execute, "42")).to eq(42)
    end
  end
  describe "#_io" do
    context "when an expression is provided" do
      it "returns a string containing the expression" do
        expr = "something"
        expect(runner.send(:_io, expression: expr)).to eq(expr)
      end
    end
    context "when a file is provided" do
      it "returns a string with the contents of the file" do
        file_name = double
        file_content = "something_else"

        allow(IO).to receive(:read).and_return file_content

        expect(runner.send(:_io, file: file_name)).to eq(file_content)
      end
    end
  end
  describe "#_file" do
    context "when a file is provided" do
      it "returns the file name" do
        file_name = double
        expect(runner.send(:_file, file: file_name)).to eq(file_name)
      end
    end
    context "when a file is not provided" do
      it "returns '/dev/null'" do
        expect(runner.send(:_file, {})).to eq("/dev/null")
      end
    end
  end
  # unsure yet how to test this
  # describe "#_repl_loop" do
  # end
end
