if Rails.env.development?
  require 'bundler/audit/task'

  Bundler::Audit::Task.new

  desc 'Run security checks'
  task :security do
    Rake::Task['check'].invoke
  end
end
