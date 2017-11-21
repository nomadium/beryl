# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Compiler do
  subject(:compiler) { described_class.new(backend: :jruby) }

  describe "#compile" do
    context "when unsupported back end is requested" do
      it "raises error" do
        ast = double
        expect { described_class.new(backend: :mri).compile(ast) }
          .to raise_error(Beryl::Error)
      end
    end
    context "when a supported back end is used" do
      it "returns whatever the backend return" do
        ast    = double
        result = double

        allow(Beryl::Compiler::Jruby)
          .to receive(:compile).with(ast, context: {}).and_return(result)

        expect(compiler.compile(ast)).to eq(result)
      end
    end
  end
end
