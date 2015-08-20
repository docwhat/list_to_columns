require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: :test

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:style)

RSpec::Core::RakeTask.new('ci:spec') do |task|
  task.rspec_opts = %w(
    --color
    --order rand
    --tty
    --format doc
  )
end

task ci: [:style, 'ci:spec']

desc 'Runs all the tests'
task test: [:spec, :style]
