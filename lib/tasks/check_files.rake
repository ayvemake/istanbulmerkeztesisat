namespace :check do
  desc "Check usage of specific files"
  task :files => :environment do
    files_to_check = {
      'app/javascript/service_worker.js' => ['service-worker', 'serviceworker'],
      'app/javascript/manifest.json' => ['manifest.json'],
      'app/views/layouts/mailer.html.erb' => ['mailer', 'InquiryMailer'],
      'app/views/layouts/mailer.text.erb' => ['mailer', 'InquiryMailer'],
      'app/views/shared/_contact_info.html.erb' => ['contact_info', 'render.*contact_info'],
      'app/views/shared/_image_carousel.html.erb' => ['image_carousel', 'render.*image_carousel']
    }

    puts "\n=== Checking File Usage ===\n"

    files_to_check.each do |file, patterns|
      puts "\n📁 #{file}"
      if File.exist?(file)
        references = patterns.map do |pattern|
          refs = `git grep -l "#{pattern}" app/ config/ lib/`.split("\n")
          refs.reject { |ref| ref == file } # Exclure l'auto-référence
        end.flatten.uniq

        if references.empty?
          puts "⚠️  WARNING: No references found - File might be unused"
        else
          puts "✅ Referenced in #{references.size} file(s):"
          references.each { |ref| puts "   └─ #{ref}" }
        end
      else
        puts "❌ File does not exist"
      end
    end

    puts "\n=== Suggestions ===\n"
    puts "* Files marked with ⚠️  should be reviewed for removal"
    puts "* Files marked with ❌ should be created if needed or removed from version control"
  end

  desc "Clean unused files"
  task :clean => :environment do
    puts "This will remove unused files. Are you sure? (y/n)"
    confirm = STDIN.gets.chomp.downcase
    if confirm == 'y'
      # Ajoutez ici la logique pour supprimer les fichiers
      puts "Cleaning unused files..."
    else
      puts "Operation cancelled"
    end
  end
end 