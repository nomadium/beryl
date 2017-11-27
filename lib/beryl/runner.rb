# frozen_string_literal: true

require "java"

module Beryl
  # To put everything Beryl in motion: parse, compile and execute.
  class Runner
    def self.run(args)
      new(args: args).execute
    end

    def initialize(args: {}, platform: :jruby)
      @platform = platform
      @parser   = Beryl::Parser.new
      case @platform
      when :jruby
        @runtime_config = org.jruby.RubyInstanceConfig.new
        # @runtime_config.debug = true
        # @runtime_config.show_bytecode = true
        @runtime = org.jruby.Ruby.newInstance(@runtime_config)
      else
        raise Beryl::Error, "#{@platform} is not a supported Beryl platform"
      end
      @io = _io(args)
    end

    attr_reader :parser, :platform, :runtime, :runtime_config

    def execute
      _run_bootstrap

      ast = parser.parse(io)
      scope = runtime.current_context.current_scope
      compiler_context = { scope: scope }
      root_ast = Beryl::Compiler.new.compile(ast, context: compiler_context)
      runtime.run_normally(root_ast)
    end

    private

    attr_reader :io

    def _io(args)
      args.key?(:expression) ? args[:expression].to_s : IO.read(args[:file])
    end

    def _run_bootstrap
      bootstrap_base_name = "bootstrap.rb"
      bootstrap_module = File.join(File.expand_path(__dir__),
                                   bootstrap_base_name)
      runtime.execute_script(IO.read(bootstrap_module), bootstrap_base_name)
    end
  end
end
