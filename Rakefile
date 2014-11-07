# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

if Rails.env.test? || Rails.env.development?
  require 'rubocop/rake_task'

  desc 'Run RuboCop'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # only show the files with failures
    task.formatters = ['files']
    # don't abort rake on failure
    task.fail_on_error = true
  end
end

Cube::Application.load_tasks

desc 'Run Cube Tests'
task :cube_test do
  Rake::Task['spec'].invoke
  Rake::Task['cucumber'].invoke
  Rake::Task['brakeman:run'].invoke('brakeman-output.tabs brakeman-output.html')
  Rake::Task['rubocop'].invoke
  Rake::Task['stats'].invoke
end

desc 'Run Cube Documentation Generation'
task :cube_doc do
  Rake::Task['doc:app'].invoke
  # Rake::Task['erd'].invoke(filetype: 'png')
  # Rake::Task['rails_erd'].invoke(filetype: %w(pdf png))
end
