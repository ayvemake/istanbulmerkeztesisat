class ImageOptimizerService
  def self.optimize(image_path, options = {})
    # Configuration par défaut
    default_options = {
      quality: 80,
      format: 'webp',
      resize: '1200x>',  # Redimensionne si plus large que 1200px
      strip: true        # Supprime les métadonnées
    }

    options = default_options.merge(options)

    image = MiniMagick::Image.open(image_path)

    # Optimisations
    image.strip if options[:strip]
    image.resize options[:resize] if options[:resize]
    image.quality options[:quality]
    image.format options[:format]

    image
  end
end
