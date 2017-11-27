# frozen_string_literal: true

RSpec.describe Beryl::Syntax::Constant do
  describe "#jruby_compile" do
    subject(:constant) { described_class.new(name) }

    let(:name) { "test_#{SecureRandom.random_number(100)}" }

    it "returns a jruby constant node" do
      result = constant.jruby_compile
      expect(result.node_type.simple_name).to eq("const")
    end
    it "returns a jruby constant node holding the requested name" do
      result = constant.jruby_compile
      expect(result.name).to eq(name)
    end
  end
end
