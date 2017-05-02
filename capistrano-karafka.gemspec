# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capistrano/karafka/version'

Gem::Specification.new do |spec|
  spec.name        = 'capistrano-karafka'
  spec.version     = Capistrano::Karafka::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Maciej Mensfeld']
  spec.email       = %w[ maciej@coditsu.io ]
  spec.homepage    = 'https://github.com/karafka/capistrano-karafka'
  spec.summary     = 'Karafka integration for Capistrano'
  spec.description = 'Karafka integration for Capistrano'
  spec.license     = 'MIT'

  spec.add_dependency 'capistrano'
  spec.add_dependency 'capistrano-bundler'
  spec.add_dependency 'karafka'
  spec.required_ruby_version = '>= 2.3.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w( lib )
  spec.post_install_message = %q(
    All plugins need to be explicitly installed with install_plugin.
    Please see README.md
  )
end
