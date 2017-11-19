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
      it "compiles integers" do
        value = 7
        ast = Beryl::Syntax::Integer.new(value)
        root = backend.compile(ast)
        expect(root.value).to eq(value)
      end
    end
    context "when non valid syntax is compiled" do
      it "raises error" do
        ast = Beryl::Syntax::Literal.new(:whatevs)
        expect { backend.compile(ast) }
          .to raise_error(Beryl::Error)
      end
    end
  end
end
