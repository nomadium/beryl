# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Syntax::Node do
  subject(:node) { described_class.new }

  describe "#compile" do
    context "when an unsupported back end is used" do
      it "raises an error" do
        expect { node.compile(back_end: :unsupported) }
          .to raise_error(Beryl::Error)
      end
    end
    context "when supported back end is used" do
      it "returns the back end compiler result" do
        result = double

        allow(node).to receive(:jruby_compile).and_return result

        expect(node.compile(back_end: :jruby))
          .to eq(result)
      end
    end
  end
end
