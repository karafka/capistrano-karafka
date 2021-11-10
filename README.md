# Capistrano Karafka

## Deprecation notice

This package has been deprecated. It will not work with Karafka `2.0` or newer.

There's a great explanation done by Mike Perham that I want to quote:

> I've noted for years how modern services should be managed with a proper init system. Managing services manually is more error-prone, let your operating system do it for you. systemd, upstart, and foreman are three options. See the Deployment wiki page for the latest details.

[Here](https://www.mikeperham.com/2014/09/22/dont-daemonize-your-daemons/) you can find more extensive explanation on the reasoning behind this decision.

Please refer to [this](https://github.com/karafka/karafka/wiki/Deployment#systemd--capistrano) section of the Karafka Wiki for an explanation on how to use `systemd` with Karafka.

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
* [Capistrano Karafka Actions CI](https://github.com/karafka/capistrano-karafka/actions?query=workflow%3Aci)
* [Capistrano Karafka Coditsu](https://app.coditsu.io/karafka/repositories/capistrano-karafka)

## Note on contributions

First, thank you for considering contributing to the Karafka ecosystem! It's people like you that make the open source community such a great community!

Each pull request must pass all the RSpec specs, integration tests and meet our quality requirements.

Fork it, update and wait for the Github Actions results.
