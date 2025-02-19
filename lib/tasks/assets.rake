namespace :assets do
  desc 'Build Tailwind CSS'
  task :build_tailwind do
    system('yarn build:css')
  end
end

# Hook into existing assets:precompile
if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance(['assets:build_tailwind'])
end 