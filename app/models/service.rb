class Service < ApplicationRecord
  CATEGORIES = %w[tesisat boya].freeze

  has_one_attached :image
  has_many_attached :gallery_images
  has_many :service_advantages, dependent: :destroy
  accepts_nested_attributes_for :service_advantages, allow_destroy: true

  validates :name, :description, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  
  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :tesisat, -> { where(category: 'tesisat') }
  scope :boya, -> { where(category: 'boya') }
  scope :urgent, -> { where(urgent: true) }

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
end 