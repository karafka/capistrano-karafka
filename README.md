# Capistrano Karafka

[![Gem Version](https://badge.fury.io/rb/capistrano-karafka.svg)](http://badge.fury.io/rb/capistrano-karafka)
[![Join the chat at https://gitter.im/karafka/karafka](https://badges.gitter.im/karafka/karafka.svg)](https://gitter.im/karafka/karafka?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Karafka integration for Capistrano.

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'capistrano-karafka'
```

or:

```ruby
  gem 'capistrano-karafka' , group: :development
```

And then execute:

```
  $ bundle
```

## Usage

In your **Capfile**

```ruby
require 'capistrano/karafka'
install_plugin Capistrano::Karafka
```

Take a look at the [set_defaults](https://github.com/karafka/capistrano-karafka/blob/master/lib/capistrano/karafka.rb#L16) method for options you can set. For example, to specify a different pidfile than default:

```ruby
set :karafka_pid, ->{ File.join(shared_path, 'tmp', 'pids', 'karafka0') }
```

## References

* [Karafka framework](https://github.com/karafka/karafka)
* [Capistrano Karafka](https://github.com/karafka/capistrano-karafka)
* [Waterdrop](https://github.com/karafka/waterdrop)
* [Envlogic](https://github.com/karafka/envlogic)
* [Worker Glass](https://github.com/karafka/worker-glass)
* [Null Logger](https://github.com/karafka/null-logger)

## Note on Patches/Pull Requests

Fork the project.
Make your feature addition or bug fix.
Add tests for it. This is important so I don't break it in a future version unintentionally.
Commit, do not mess with Rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull). Send me a pull request. Bonus points for topic branches.

[![coditsu](https://coditsu.io/assets/quality_bar.png)](https://coditsu.io)

Each pull request must pass our quality requirements. To check if everything is as it should be, we use [Coditsu](https://coditsu.io) that combinse multiple linters and code analyzers. Unfortunately, for now it is invite-only based, so just ping us and we will give you access to the quality results.
