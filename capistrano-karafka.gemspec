# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'capistrano-karafka'
  spec.version     = '1.3.1'
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Maciej Mensfeld']
  spec.email       = %w[maciej@mensfeld.pl]
  spec.homepage    = 'https://github.com/karafka/capistrano-karafka'
  spec.summary     = 'Karafka integration for Capistrano'
  spec.description = 'Karafka integration for Capistrano'
  spec.license     = 'LGPL-3.0'

  spec.add_dependency 'capistrano', '>= 3.9'
  spec.add_dependency 'capistrano-bundler', '>= 1.2'
  spec.add_dependency 'karafka', '~> 1.3.0'
  spec.required_ruby_version = '>= 2.5.0'

  if $PROGRAM_NAME.end_with?('gem')
    spec.signing_key = File.expand_path('~/.ssh/gem-private_key.pem')
  end

  spec.cert_chain    = %w[certs/mensfeld.pem]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
end
