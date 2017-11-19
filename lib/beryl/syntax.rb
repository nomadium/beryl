# frozen_string_literal: true

module Beryl
  # All Beryl syntax elements are defined here
  module Syntax
    autoload :Node,    "beryl/syntax/node"
    autoload :Literal, "beryl/syntax/literal"
    autoload :Integer, "beryl/syntax/integer"
  end
end
