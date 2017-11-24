# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Compiler::Jruby do
  subject(:backend) { described_class }

  describe "::noposition" do
    it "returns a dummy source code position" do
      position = double

      allow(org.jruby.lexer.yacc.SimpleSourcePosition)
        .to receive(:new).with("/dev/null", 0).and_return position

      expect(backend.noposition).to eq(position)
    end
  end
  describe "::compile" do
    context "when valid syntax is provided" do
      it "returns a JRuby AST root node" do
        ast = Beryl::Syntax::Integer.new(7)
        root_node = double

        allow(org.jruby.ast.RootNode).to receive(:new).and_return root_node

        result = backend.compile(ast, context: { scope: double })
        expect(result).to eq(root_node)
      end
    end
    context "when non valid syntax is compiled" do
      it "raises error" do
        ast = Beryl::Syntax::Literal.new(:whatevs)
        compiler_context = { scope: double }
        expect { backend.compile(ast, context: compiler_context) }
          .to raise_error(Beryl::Error)
      end
    end
  end
  describe "::_compile" do
    context "when valid syntax is provided" do
      it "compiles integers" do
        value = 42
        node = Beryl::Syntax::Integer.new(value)
        result = backend.send(:_compile, node)
        expect(result.value).to eq(value)
      end
      it "compiles very basic function calls, like a sum" do
        receiver = Beryl::Syntax::Integer.new(2)
        argument = Beryl::Syntax::Integer.new(2)
        node = Beryl::Syntax::Call.new("+",
                                       receiver: receiver,
                                       args: [argument])
        result = backend.send(:_compile, node)
        expect(result.name).to eq("+")
        expect(result.receiver_node.value)
          .to eq(described_class.send(:_compile, receiver).value)
        expect(result.args_node.last.value)
          .to eq(described_class.send(:_compile, argument).value)
      end
    end
    context "when non valid syntax is provided" do
      it "raises error" do
        expect { backend.send(:_compile, Beryl::Syntax::Literal.new("%$#2")) }
          .to raise_error(Beryl::Error)
      end
    end
  end
end
