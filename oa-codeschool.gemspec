# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'oa-codeschool/version'

Gem::Specification.new do |s|
  s.name        = 'oa-codeschool'
  s.version     = OmniAuth::Strategies::CODE_SCHOOL_VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Eric Allam']
  s.email       = ['eric@envylabs.com']
  s.homepage    = 'https://github.com/envylabs/oa-codeschool'
  s.summary     = 'Provides an OmniAuth strategy for OAuth2 on CodeSchool.com'
  s.description = 'Provides an OmniAuth strategy for OAuth2 on CodeSchool.com'
  s.licenses = ['MIT']

  s.add_runtime_dependency('omniauth', ['~> 0.2.5'])
  s.add_runtime_dependency('multi_json', ['>= 0'])
  s.add_runtime_dependency('activesupport', ['>= 0'])

  s.add_development_dependency('rspec', ['~> 2.3.0'])

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
