# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'olala/version'
#require 'olala/engine'
#require 'app/controllers/olala/labels_controller'

Gem::Specification.new do |spec|
  spec.name          = "olala"
  spec.version       = Olala::VERSION
  spec.authors       = ["Benjamin Crouzier"]
  spec.email         = ["pinouchon@gmail.com"]
  spec.description   = %q{Opinionated content editor for static websites in rails}
  spec.summary       = %q{Opinionated content editor for static websites in rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
