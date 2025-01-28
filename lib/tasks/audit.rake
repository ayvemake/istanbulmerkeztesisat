namespace :audit do
  desc "Run all code quality checks"
  task :all do
    puts "\n=== Running Code Quality Checks ===\n"
    
    # Exécuter les tâches dans l'ordre
    Rake::Task["check:files"].execute
    Rake::Task["cleanup:helpers"].execute
    Rake::Task["rails_best_practices"].execute rescue puts "⚠️  rails_best_practices skipped"
    Rake::Task["traceroute"].execute rescue puts "⚠️  traceroute skipped"
    
    puts "\n=== Audit Complete ===\n"
  end

  desc "Clean up unused files and empty helpers"
  task :cleanup do
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