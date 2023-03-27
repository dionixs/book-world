require 'bundler/audit/task'

Bundler::Audit::Task.new

task security: :audit
