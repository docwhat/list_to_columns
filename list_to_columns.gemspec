# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'list_to_columns/version'

Gem::Specification.new do |spec|
  spec.name          = 'list_to_columns'
  spec.version       = ListToColumns::VERSION
  spec.authors       = ['Christian Höltje']
  spec.email         = ['docwhat@gerf.org']

  spec.summary       = 'Formats a list into columns'
  spec.description   = 'Given an Array of Strings, it formats it into '\
    'columns to make it more compact for terminal displays.'
  spec.homepage      = 'https://github.com/docwhat/list_to_columns'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'psych'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-given'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'semver2', '~> 3.4'
end
