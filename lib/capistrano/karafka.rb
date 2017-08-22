# frozen_string_literal: true

require 'capistrano/bundler'
require 'capistrano/plugin'

# Capistrano stuff
module Capistrano
  # Karafka Capistrano integration
  class Karafka < Capistrano::Plugin
    # Names of files that store capistrano procedures
    CAP_FILES = %w[
      karafka
      karafka/start
      karafka/stop
      karafka/restart
      karafka/status
    ].freeze

    # Default values for Karafka settings
    def set_defaults
      set_if_empty :karafka_role, :karafka
      set_if_empty :karafka_processes, 1
      set_if_empty :karafka_consumer_groups, []
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

Capistrano::Karafka::CAP_FILES.each do |cap_file|
  eval File.open(File.expand_path("../tasks/#{cap_file}.cap", __FILE__), 'r').read
end
