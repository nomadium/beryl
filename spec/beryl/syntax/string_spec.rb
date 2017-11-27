# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Syntax::String do
  describe "#jruby_compile" do
    subject(:string) { described_class.new(value) }

    let(:value) { "test_#{SecureRandom.random_number(100)}" }

    it "returns a jruby string node" do
      result = string.jruby_compile
      expect(result.node_type.simple_name).to eq("str")
    end
    it "returns a jruby strng node with the expected value" do
      result = string.jruby_compile
      expect(result.value).to eq(value)
    end
  end
end
