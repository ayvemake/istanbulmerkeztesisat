class Service < ApplicationRecord
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

  scope :active, -> { where(active: true) }
  scope :by_type, ->(type) { where(service_type: type) }
  scope :featured, -> { active.limit(4) }

  serialize :key_features, Array, coder: YAML
end 