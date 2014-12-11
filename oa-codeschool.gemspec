# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oa-codeschool/version'

Gem::Specification.new do |spec|
  spec.name          = "oa-codeschool"
  spec.version       = OmniAuth::Strategies::VERSION
  spec.authors       = ["Eric Allam", "Olivier Lacan"]
  spec.email         = ["vendor@codeschool.com"]
  spec.summary       = %q{OAuth2 OmniAuth strategy for Code School}
  spec.description   = %q{OAuth2 OmniAuth strategy for Code School}
  spec.homepage      = "https://github.com/codeschool/oa-codeschool/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('omniauth', ['~> 0.2.5'])
  spec.add_runtime_dependency('multi_json', ['>= 0'])
  spec.add_runtime_dependency('activesupport', ['>= 0'])

  spec.add_development_dependency('rspec', ['~> 2.3.0'])
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
