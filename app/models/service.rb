class Service < ApplicationRecord
  CATEGORIES = %w[tesisat boya].freeze

  has_one_attached :image
  has_many_attached :gallery_images
  has_many :service_advantages, dependent: :destroy
  accepts_nested_attributes_for :service_advantages, allow_destroy: true

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  
  EXCLUDED_SERVICES = ['Kalorifer Tesisatı', 'Doğalgaz Tesisatı', 'Ahşap Boyama'].freeze

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :by_category, ->(category) { where(category: category) }
  scope :tesisat, -> { 
    where(category: 'tesisat')
    .where.not(name: EXCLUDED_SERVICES)
  }
  scope :boya, -> { 
    where(category: 'boya')
    .where.not(name: EXCLUDED_SERVICES)
  }
  scope :urgent, -> { where(urgent: true) }
  scope :available_services, -> { 
    where.not(name: EXCLUDED_SERVICES)
  }

  def default_image
    "services/#{category}_default.jpg"
  end

  def display_image
    image.attached? ? image : default_image
  end

  # Convertir le nom en format URL-friendly
  def parameterized_name
    name.parameterize
  end

  def available_24_7?
    attributes['available_24_7'] || category == 'tesisat'
  end
  
  def warranty?
    attributes['warranty'] || true # Par défaut, tous les services sont garantis
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

  def gallery_images_data
    gallery_images.map do |image|
      {
        thumbnail: rails_representation_url(image.variant(resize: "100x100")),
        large: rails_representation_url(image.variant(resize: "1200x800")),
        width: 1200,
        height: 800
      }
    end
  end

  def display_images
    if gallery_images.attached?
      gallery_images
    else
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
  end

  def first_image
    if image.attached?
      image
    elsif gallery_images.attached?
      gallery_images.first
    else
      case category
      when 'tesisat'
        'sanitary/general/general1.webp'
      when 'boya'
        'paint/renovate/renovate1.webp'
      else
        'default-service.webp'
      end
    end
  end
end 