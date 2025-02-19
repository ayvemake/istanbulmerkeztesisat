class ServicePreview
  include ActiveModel::Model

  attr_accessor :name, :description, :category, :featured, :active, :urgent,
                :available_24_7, :warranty, :image_path, :gallery_images_paths,
                :advantages, :first_image, :service_advantages

  def self.create(attributes = {})
    # Convertir les clés de string en symbol pour la compatibilité
    attributes = attributes.transform_keys(&:to_sym)
    
    # Gérer les avantages
    advantages = if attributes[:advantages].present?
      build_service_advantages(attributes.delete(:advantages))
    elsif attributes[:service_advantages].present?
      attributes.delete(:service_advantages)
    else
      []
    end
    
    # Conversion des clés pour correspondre à notre nouveau modèle
    attributes = attributes.transform_keys do |key|
      case key
      when :available_24h
        :available_24_7
      when :first_image
        :image_path
      else
        key
      end
    end

    # Ajout des valeurs par défaut
    attributes = {
      featured: false,
      active: true,
      warranty: true,
      gallery_images_paths: [],
      service_advantages: advantages
    }.merge(attributes)

    new(attributes)
  end

  def self.build_service_advantages(advantages)
    advantages.map do |advantage|
      ServiceAdvantagePreview.new(
        title: advantage[:title],
        description: advantage[:description]
      )
    end
  end

  # Méthode d'accès pour la compatibilité
  def advantages
    service_advantages
  end

  def display_image
    image_path || first_image || default_image
  end

  def default_image
    "services/#{category}_default.jpg"
  end

  def parameterized_name
    name.parameterize
  end

  def available_24_7?
    available_24_7 || category == 'tesisat'
  end

  def warranty?
    warranty.nil? ? true : warranty
  end

  def meta_description
    "#{name} - #{description.truncate(150)}"
  end

  def meta_keywords
    [
      name,
      category,
      'hizmet',
      urgent? ? 'acil servis' : nil,
      available_24_7? ? '7/24 hizmet' : nil,
      'İstanbul'
    ].compact.join(', ')
  end

  def display_images
    gallery_images_paths || default_gallery_images
  end

  def default_gallery_images
    case category
    when 'tesisat'
      [
        'sanitary/general/general1.webp',
        'sanitary/general/general2.webp',
        'sanitary/general/general3.webp'
      ]
    when 'boya'
      [
        'paint/renovate/renovate1.webp',
        'paint/renovate/renovate2.webp',
        'paint/renovate/renovate3.webp'
      ]
    else
      ['default-service.webp']
    end
  end

  def first_image
    display_image
  end
end
