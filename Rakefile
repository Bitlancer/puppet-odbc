require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp", "spec/fixtures/**/*.pp"]

task test: %w(lint spec)
