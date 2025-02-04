namespace :unused do
  desc 'Find potentially unused files'
  task find: :environment do
    def find_references(pattern)
      refs = `git grep -l "#{pattern}" app lib config`
      refs.split("\n")
    end

    Dir.glob('app/**/*.rb').each do |file|
      next if file =~ /application_/

      class_name = File.basename(file, '.rb').camelize
      refs = find_references(class_name)

      puts "Potentially unused: #{file}" if refs.size <= 1 # Only self-reference
    end
  end
end
