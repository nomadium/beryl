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
  # it should be tested
  # describe "#_run_bootstrap" do
  # end
end
