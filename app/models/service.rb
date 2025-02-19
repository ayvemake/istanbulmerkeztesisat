class Service
  include ActiveModel::Model
  
  attr_accessor :name, :description, :category, :featured, :active, :urgent, 
                :available_24_7, :warranty, :image_path, :gallery_images_paths,
                :advantages, :service_advantages

  CATEGORIES = %w[tesisat boya].freeze
  EXCLUDED_SERVICES = ['Kalorifer Tesisatı', 'Doğalgaz Tesisatı', 'Ahşap Boyama'].freeze

  def self.all
    @services ||= begin
      yaml_data = YAML.load_file(Rails.root.join('config/data/services.yml'))
      services = []
      
      yaml_data.each do |category, category_services|
        category_services.each do |service_data|
          # Convertir les clés
          service_data = service_data.transform_keys do |key|
            case key.to_s
            when 'available_24h'
              'available_24_7'
            when 'first_image'
              'image_path'
            else
              key
            end
          end

          # Convertir les avantages en objets ServiceAdvantagePreview
          advantages = service_data['advantages']&.map do |adv|
            ServiceAdvantagePreview.new(
              title: adv['title'],
              description: adv['description']
            )
          end || []

          # Ajouter les valeurs par défaut
          service_data = {
            'featured' => false,
            'active' => true,
            'warranty' => true,
            'gallery_images_paths' => []
          }.merge(service_data)

          # Créer le service avec les avantages convertis
          service_data = service_data.merge(
            'category' => category,
            'service_advantages' => advantages
          )
          
          services << new(service_data)
        end
      end
      
      services
    end
  end

  def self.featured
    ServiceCollection.new(all.select(&:featured))
  end

  def self.active
    ServiceCollection.new(all.select(&:active))
  end

  def self.by_category(category)
    ServiceCollection.new(all.select { |service| service.category == category })
  end

  def self.tesisat
    ServiceCollection.new(all.select do |service| 
      service.category == 'tesisat' && !EXCLUDED_SERVICES.include?(service.name)
    end)
  end

  def self.boya
    ServiceCollection.new(all.select do |service| 
      service.category == 'boya' && !EXCLUDED_SERVICES.include?(service.name)
    end)
  end

  def self.urgent
    ServiceCollection.new(all.select(&:urgent))
  end

  def self.find_by(conditions)
    all.find { |service| conditions.all? { |key, value| service.send(key) == value } }
  end

  def display_image
    image_path || default_image
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

  # Pour la compatibilité avec Active Record
  def self.with_attached_image
    all
  end

  def self.with_attached_gallery_images
    all
  end

  def self.to_a
    all
  end

  # Méthode d'accès pour la compatibilité
  def advantages
    service_advantages
  end

  # Classe pour wrapper les collections de services
  class ServiceCollection
    include Enumerable
    
    def initialize(services)
      @services = services
    end

    def each(&block)
      @services.each(&block)
    end

    def with_attached_image
      self
    end

    def with_attached_gallery_images
      self
    end

    def to_a
      @services
    end
  end
end
