# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/karafka/version'

Gem::Specification.new do |spec|
  spec.name = 'capistrano-karafka'
  spec.version = Capistrano::Karafka::VERSION
  spec.authors = ['Maciej Mensfeld']
  spec.email = ['maciej@coditsu.io']
  spec.description = %q{Karafka integration for Capistrano}
  spec.summary = %q{Karafka integration for Capistrano}
  spec.homepage = 'https://github.com/karafka/capistrano-karafka'
  spec.license = 'MIT'

  spec.required_ruby_version     = '>= 1.9.3'

  spec.files = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano'
  spec.add_dependency 'capistrano-bundler'
  spec.add_dependency 'karafka'
  spec.post_install_message = %q{
    All plugins need to be explicitly installed with install_plugin.
    Please see README.md
  }
end
