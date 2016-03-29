$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'assets_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'assets_rails'
  s.version     = AssetsRails::VERSION
  s.authors     = ['Shoya Tanaka']
  s.email       = ['8398a7@gmail.com']
  s.homepage    = 'https://github.com/8398a7/assets_rails'
  s.summary     = 'This is assets helper for rails.'
  s.description = 'This is assets helper for rails'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails'
  s.add_development_dependency 'rspec-rails'
end
