# frozen_string_literal: true

require "spec_helper"

RSpec.describe Beryl::Parser do
  subject(:parser) { described_class.new }

  describe "#parse" do
    context "when valid syntax is provided" do
      it "parses integers" do
        code = "42"
        ast = parser.parse(code)
        expect(ast.value).to eq(code.to_i)
      end
    end
    context "when not valid syntax is provided" do
      it "raises an error" do
        expect { parser.parse("^%#!garbage") }
          .to raise_error(Beryl::Error)
      end
    end
  end
end
