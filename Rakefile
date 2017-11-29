require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = %w[--display-cop-names --extra-details --display-style-guide]
end

task default: %i[spec rubocop]
