# Capistrano Karafka

[![Gem Version](https://badge.fury.io/rb/capistrano-karafka.svg)](http://badge.fury.io/rb/capistrano-karafka)
[![Join the chat at https://gitter.im/karafka/karafka](https://badges.gitter.im/karafka/karafka.svg)](https://gitter.im/karafka/karafka?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Karafka integration for Capistrano.

## Installation

Add this line to your application Gemfile:

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
set :karafka_pid, ->{ File.join(shared_path, 'tmp', 'pids', 'karafka.pid') }
```

**Warning**: In order to make capistrano-karafka work with multiple processes, pidfile needs to end with ```.pid```.

## Multiple processes

You can configure Karafka to start with multiple processes. Just set the proper amount in ```karafka_processes```.

```ruby
set :karafka_processes, 4
```

## Different number of processes per host

You can configure how many processes you want to run on each host in the following way:

```ruby
set :karafka_role, %i[karafka_small karafka_big]
set :karafka_small_processes, 1
set :karafka_big_processes, 4
server 'example-small.com', roles: %i[karafka_small]
server 'example-big.com', roles: %i[karafka_big]
```

## Different active consumer groups per host and process

You can also easily start Karafka with a limited set of consumer groups running per each process for a given host:

```ruby
set :karafka_role, %i[karafka_small karafka_big]

set :karafka_small_processes, 1
set :karafka_small_consumer_groups, %w[
  group_a
]

set :karafka_big_processes, 4
set :karafka_small_consumer_groups, [
  'group_a group_b',
  'group_c group_d',
  'group_e',
  'group_f'
]

server 'example-small.com', roles: %i[karafka_small]
server 'example-big.com', roles: %i[karafka_big]
```

By default, capistrano-karafka will start Karafka processes without limiting consumer groups, which means that each process will be running all of them.

## References

* [Karafka framework](https://github.com/karafka/karafka)
* [Capistrano Karafka](https://github.com/karafka/capistrano-karafka)
* [Waterdrop](https://github.com/karafka/waterdrop)
* [Envlogic](https://github.com/karafka/envlogic)
* [Null Logger](https://github.com/karafka/null-logger)

## Note on Patches/Pull Requests

Fork the project.
Make your feature addition or bug fix.
Add tests for it. This is important so I don't break it in a future version unintentionally.
Commit, do not mess with Rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull). Send me a pull request. Bonus points for topic branches.

[![coditsu](https://coditsu.io/assets/quality_bar.svg)](https://app.coditsu.io/coditsu/repositories/capistrano-karafka)

Each pull request must pass our quality requirements. To check if everything is as it should be, we use [Coditsu](https://app.coditsu.io/coditsu/repositories/capistrano-karafka) that combinse multiple linters and code analyzers.
