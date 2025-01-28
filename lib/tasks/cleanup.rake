namespace :cleanup do
  desc "Remove empty or unused helpers"
  task :helpers => :environment do
    helpers_to_check = [
      'app/helpers/pages_helper.rb',
      'app/helpers/static_pages_helper.rb',
      'app/helpers/application_helper.rb',
      'app/helpers/icon_helper.rb',
      'app/helpers/schema_helper.rb',
      'app/helpers/service_details_helper.rb',
      'app/helpers/services_helper.rb'
    ]

    helpers_to_check.each do |helper_path|
      if File.exist?(helper_path)
        content = File.read(helper_path)
        if content.strip == "module #{File.basename(helper_path, '.rb').camelize}\nend"
          puts "🗑️  Empty helper found: #{helper_path}"
        else
          puts "📝 Helper with content: #{helper_path}"
        end
      end
    end
  end
end 