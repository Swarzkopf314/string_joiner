# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_joiner/version'

Gem::Specification.new do |spec|
  spec.name          = "string_joiner"
  spec.version       = StringJoiner::VERSION
  spec.authors       = ["Maciej"]
  spec.email         = ["msatkiewicz@gmail.com"]

  spec.summary       = %q{Adds a StringJoiner class which provides simple functionality for joining strings,
                          so that you don't need to worry about blanks, separators, symbols, nils, TypeErrors etc.
                          Has no (production) dependecies, but requires Ruby 2.0.}
  spec.homepage      = "https://github.com/Swarzkopf314/string_joiner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  
end
