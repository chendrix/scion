# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scion/version'

Gem::Specification.new do |spec|
  spec.name          = 'scion'
  spec.version       = Scion::VERSION
  spec.authors       = ['Chris Hendrix']
  spec.email         = ['cah276@cornell.edu']
  spec.summary       = %q{Rolls dice for Scion.}
  spec.homepage      = 'https://github.com/chendrix/scion'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_dependency 'rake', '~> 10.0'
  spec.add_dependency 'thor', '~> 0.19.1'
end
