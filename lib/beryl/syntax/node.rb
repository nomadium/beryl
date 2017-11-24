# frozen_string_literal: true

module Beryl
  module Syntax
    # Anything related to all Beryl syntax nodes goes here
    class Node
      def compile(back_end: DEFAULT_BACK_END)
        send("#{back_end}_compile".to_sym)
      rescue NoMethodError
        raise Beryl::Error,
              "#{back_end} is not a supported compilation back end"
      end
    end
  end
end
