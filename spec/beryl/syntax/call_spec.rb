# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Syntax::Call do
  subject(:syntax_call) do
    described_class.new(op, receiver: receiver, args: [argument])
  end

  let(:receiver) do
    Beryl::Syntax::Integer.new(SecureRandom.random_number(100))
  end
  let(:argument) do
    Beryl::Syntax::Integer.new(SecureRandom.random_number(100))
  end
  let(:op) { %w[+].sample }

  describe "#compile" do
    context "when an unsupported back end is used" do
      it "raises an error" do
        expect { syntax_call.compile(back_end: :unsupported) }
          .to raise_error(Beryl::Error)
      end
    end
    context "when supported back end is used" do
      # this test can be clearly improved
      it "returns the back end compiler result" do
        jruby_call_node = syntax_call.jruby_compile
        expect(syntax_call.compile(back_end: :jruby).name)
          .to eq(jruby_call_node.name)
      end
    end
  end
  describe "#jruby_compile" do
    it "returns a jruby call node" do
      jruby_call_node = syntax_call.jruby_compile
      expect(jruby_call_node.node_type.simple_name).to eq("call")
    end
    it "returns a jruby call node with requested operation" do
      jruby_call_node = syntax_call.jruby_compile
      expect(jruby_call_node.name).to eq(op)
    end
    it "returns a jruby call node with requested receiver" do
      jruby_call_node = syntax_call.jruby_compile
      expect(jruby_call_node.receiver_node.value)
        .to eq(Beryl::Compiler::Jruby.send(:_compile, receiver).value)
    end
    it "returns a jruby call node with requested argument" do
      jruby_call_node = syntax_call.jruby_compile
      expect(jruby_call_node.args_node.last.value)
        .to eq(Beryl::Compiler::Jruby.send(:_compile, argument).value)
    end
  end
  describe "#_jruby_array_node" do
    it "returns a jruby array node" do
      jruby_array_node = syntax_call.send(:_jruby_array_node)
      expect(jruby_array_node.node_type.simple_name).to eq("array")
    end
    it "contains the value passed as argument" do
      jruby_array_node = syntax_call.send(:_jruby_array_node)
      expect(jruby_array_node.last.value).to eq(argument.value)
    end
  end
end
