# frozen_string_literal: true

require 'capistrano/bundler'
require 'capistrano/plugin'

module Capistrano
  class Karafka < Capistrano::Plugin
    def define_tasks
      eval_rakefile File.expand_path('../tasks/karafka.cap', __FILE__)
    end

    def set_defaults
      set_if_empty :karafka_role, :app
      set_if_empty :karafka_default_hooks, -> { true }
      set_if_empty :karafka_env, -> { fetch(:karafka_env, fetch(:environment)) }
      set_if_empty :karafka_pid, -> { File.join(shared_path, 'tmp', 'pids', 'karafka.pid') }
    end

    def register_hooks
      after 'deploy:finished', 'karafka:restart'
    end
  end
end
