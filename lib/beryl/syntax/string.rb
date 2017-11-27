# frozen_string_literal: true

module Beryl
  module Syntax
    # String behavior definition
    class String < Literal
      def initialize(value)
        super(value.to_s)
      end

      def jruby_compile
        noposition = Beryl::Compiler::Jruby.noposition
        # there should be a best way to create a ByteList... to-do: research!
        str_value_as_bytelist = org.jruby.util.ByteList.new(value.to_java_bytes)
        org.jruby.ast.StrNode.new(noposition, str_value_as_bytelist)
      end
    end
  end
end
