# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Syntax::Integer do
  subject(:integer) { described_class.new(SecureRandom.random_number(100)) }

  describe "#jruby_compile" do
    it "returns a jruby fixnum node" do
      jruby_fixnum_node = integer.jruby_compile
      expect(jruby_fixnum_node.node_type.simple_name).to eq("fixnum")
    end
    it "returns a jruby fixnum node with the same value" do
      jruby_fixnum_node = integer.jruby_compile
      expect(jruby_fixnum_node.value).to eq(integer.value)
    end
  end
end
