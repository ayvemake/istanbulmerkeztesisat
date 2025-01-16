class Service < ApplicationRecord
  has_one_attached :image
  enum category: { painting: 0, plumbing: 1 }

  CATEGORIES = {
    'Tesisat ve Bakım' => {
      'Su Kaçağı Tespiti ve Tamiri' => 'leak_detection',
      'Tuvalet ve Lavabo Tamiri' => 'plumbing_repair',
      'Tıkanıklık ve Gider Açma' => 'drain_cleaning',
      'Kombi Bakım ve Tamiri' => 'heating_maintenance',
      'Klima Montaj ve Bakım' => 'ac_service',
      'Boya ve Dekorasyon' => 'painting',
      'Elektrik Tesisatı' => 'electrical'
    }
  }.freeze

  validates :name, presence: true
  validates :description, presence: true
  validates :service_type, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  scope :active, -> { where(active: true) }
  scope :by_type, ->(type) { where(service_type: type) }
  scope :featured, -> { active.limit(4) }

  serialize :key_features, Array, coder: YAML

  before_validation :set_default_category, on: :create

  private

  def set_default_category
    self.category ||= :painting
  end
end 