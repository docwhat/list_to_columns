# frozen_string_literal: true

require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: :test

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:style)

# building should depend on the tests passing.
task build: [:test]

# Test task
desc 'Runs all the tests'
task test: %i[spec style]
