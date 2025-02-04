require_relative 'images/constants'

namespace :images do
  include Images

  desc 'Optimize and organize service images'
  task optimize: :environment do
    require 'mini_magick'

    def optimize_image(input_path, output_path)
      return if File.exist?(output_path)

      begin
        image = MiniMagick::Image.open(input_path)

        # Optimisation de l'image
        image.resize '1200x800>' # Redimensionne si plus grand
        image.quality 85        # Qualité de compression
        image.format 'webp'     # Conversion en WebP

        # Créer le dossier de destination si nécessaire
        FileUtils.mkdir_p(File.dirname(output_path))

        image.write output_path
        puts "✓ Optimized: #{File.basename(output_path)}"
      rescue StandardError => e
        puts "✗ Error processing #{File.basename(input_path)}: #{e.message}"
      end
    end

    # Parcourir la structure des services
    SERVICES.each do |category, services|
      services.each do |service_type, filenames|
        source_dir = Rails.root.join('app', 'assets', 'images', 'original', category, service_type)
        target_dir = Rails.root.join('app', 'assets', 'images', category, service_type)

        # Créer les dossiers nécessaires
        FileUtils.mkdir_p(target_dir)

        # Traiter chaque image du dossier source
        Dir.glob("#{source_dir}/*").each_with_index do |file, index|
          next if File.directory?(file)

          output_filename = filenames[index] || "#{service_type}#{index + 1}.webp"
          output_path = File.join(target_dir, output_filename)

          optimize_image(file, output_path)
        end
      end
    end

    puts "\nImage optimization completed!"
    puts "\nStructure des dossiers créée :"
    system('tree app/assets/images/sanitary app/assets/images/paint')
  end
end
