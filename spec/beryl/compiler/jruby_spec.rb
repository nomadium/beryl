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
end
