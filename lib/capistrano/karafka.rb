# frozen_string_literal: true

require 'capistrano/bundler'
require 'capistrano/plugin'

# Capistrano stuff
module Capistrano
  # Karafka Capistrano integration
  class Karafka < Capistrano::Plugin
    # Defines all the capistrano tasks by taking them from the rake cap file
    def define_tasks
      eval_rakefile File.expand_path('../tasks/karafka.cap', __FILE__)
    end

    # Default values for Karafka settings
    def set_defaults
      set_if_empty :karafka_role, :app
      set_if_empty :karafka_default_hooks, -> { true }
      set_if_empty :karafka_env, -> { fetch(:karafka_env, fetch(:environment)) }
      set_if_empty :karafka_pid, -> { File.join(shared_path, 'tmp', 'pids', 'karafka.pid') }
    end

    # Deploy hooks registration
    def register_hooks
      after 'deploy:finished', 'karafka:restart'
    end
  end
end
