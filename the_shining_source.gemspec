$:.push File.expand_path('../lib', __FILE__)
require "the_shining_source/version"

Gem::Specification.new do |s|
  
  s.name          = 'the_shining_source'
  s.authors       = ["Phil Newton"]
  s.email         = ['phil@sodaware.net']
  s.homepage      = 'https://github.com/the-shining-source/tss-api-gem'
  s.summary       = %q{ Ruby wrapper for the Shining source API}
  s.description   = %q{ Ruby wrapper for the Shining Source API. It's pretty awesome. }
  s.version       = TheShiningSource::VERSION::STRING.dup
  s.platform      = Gem::Platform::RUBY
  
  # GEM files
  s.files         = Dir['Rakefile', '{features,lib,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
  
  # Dependencies
  s.add_dependency 'hashie', '~> 1.2.0'
  s.add_dependency 'faraday', '~> 0.8.1'
  s.add_dependency 'faraday_middleware', '~> 0.8'
  s.add_dependency 'multi_json', '~> 1.4'
  s.add_dependency 'oauth2'
  s.add_dependency 'nokogiri', '~> 1.5.2'
  
  # Development dependencies
  s.add_development_dependency 'rspec', '>= 0'
  s.add_development_dependency 'webmock', '~> 1.9.0'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'simplecov-rcov'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'ci_reporter'
  
end
