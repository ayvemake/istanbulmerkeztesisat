namespace :images do
  desc "Optimize images for web"
  task optimize: :environment do
    require 'mini_magick'

    source_dir = Rails.root.join('app/assets/images/services')
    Dir.mkdir(source_dir) unless Dir.exist?(source_dir)
    
    Dir.glob("#{source_dir}/*.{png,jpg,jpeg}").each do |image_path|
      begin
        original = MiniMagick::Image.open(image_path)
        filename = File.basename(image_path, ".*")
        
        # Créer le dossier de destination s'il n'existe pas
        FileUtils.mkdir_p(source_dir)

        # Version mobile très optimisée
        puts "Optimizing mobile version of #{filename}..."
        mobile = original.dup
        mobile.resize "640x360>" # 16:9 ratio
        mobile.quality "60"
        mobile.strip
        mobile.format "webp" do |cmd|
          cmd.auto_orient
          cmd.sampling_factor "4:2:0"
          cmd.interlace "Plane"
          cmd.gaussian_blur "0.05"
        end
        mobile.write("#{source_dir}/#{filename}_mobile.webp")

        # Version desktop optimisée
        puts "Optimizing desktop version of #{filename}..."
        desktop = original.dup
        desktop.resize "1024x576>" # 16:9 ratio
        desktop.quality "75"
        desktop.strip
        desktop.format "webp" do |cmd|
          cmd.auto_orient
          cmd.sampling_factor "4:2:0"
          cmd.interlace "Plane"
        end
        desktop.write("#{source_dir}/#{filename}.webp")

        puts "Successfully optimized #{filename}"
      rescue => e
        puts "Error processing #{image_path}: #{e.message}"
      end
    end
  end
end 