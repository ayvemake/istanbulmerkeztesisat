namespace :audit do
  desc 'Run all code quality checks'
  task all: :environment do
    run_quality_checks
  end

  private

  def run_quality_checks
    puts "\n=== Running Code Quality Checks ===\n"
    execute_tasks
    puts "\n=== Audit Complete ===\n"
  end

  def execute_tasks
    execute_task('check:files')
    execute_task('cleanup:helpers')
    execute_task('rails_best_practices', optional: true)
    execute_task('traceroute', optional: true)
  end

  def execute_task(task_name, optional: false)
    Rake::Task[task_name].execute
  rescue StandardError
    puts "⚠️  #{task_name} skipped" if optional
    raise unless optional
  end

  desc 'Clean up unused files and empty helpers'
  task cleanup: :environment do
    puts "\n=== Starting Cleanup ===\n"

    files_to_remove = [
      'app/helpers/pages_helper.rb',
      'app/helpers/static_pages_helper.rb'
    ]

    files_to_remove.each do |file|
      if File.exist?(file)
        puts "Removing #{file}..."
        File.delete(file)
      end
    end

    puts "\n=== Cleanup Complete ===\n"
  end
end
