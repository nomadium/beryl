# frozen_string_literal: true

require "jruby"

module Beryl
  # All Beryl syntax elements are defined here
  module Syntax
    autoload :Node,     "beryl/syntax/node"
    autoload :Literal,  "beryl/syntax/literal"
    autoload :Integer,  "beryl/syntax/integer"
    autoload :Call,     "beryl/syntax/call"
    autoload :Constant, "beryl/syntax/constant"
  end
end
