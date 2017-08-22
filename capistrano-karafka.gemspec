# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'capistrano-karafka'
  spec.version     = '1.1.0'
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Maciej Mensfeld']
  spec.email       = %w[maciej@coditsu.io]
  spec.homepage    = 'https://github.com/karafka/capistrano-karafka'
  spec.summary     = 'Karafka integration for Capistrano'
  spec.description = 'Karafka integration for Capistrano'
  spec.license     = 'MIT'

  spec.add_dependency 'capistrano', '>= 3.9'
  spec.add_dependency 'capistrano-bundler'
  spec.add_dependency 'karafka', '>= 0.5'
  spec.required_ruby_version = '>= 2.3.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
end
