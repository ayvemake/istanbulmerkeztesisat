class ThermalImage < ApplicationRecord
  # attributs : url:string, title:string
  validates :title, presence: true
  
  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(display_order: :asc) }
  
  def self.seed_default_images
    [
      {
        title: 'Termal Kamera ile Su Kaçağı Tespiti',
        description: 'Duvar içindeki su kaçağının termal kamera ile tespiti',
        image_url: 'sanitary/thermal/thermal1.webp',
        featured: true,
        display_order: 1
      },
      {
        title: 'Hassas Kaçak Tespiti',
        description: 'Milimetrik hassasiyette su kaçağı tespiti',
        image_url: 'sanitary/thermal/thermal2.webp',
        featured: true,
        display_order: 2
      },
      {
        title: 'Noktasal Tespit',
        description: 'Su kaçağının tam yerinin belirlenmesi',
        image_url: 'sanitary/thermal/thermal3.webp',
        featured: false,
        display_order: 3
      }
    ].each do |image_data|
      ThermalImage.find_or_create_by!(title: image_data[:title]) do |image|
        image.assign_attributes(image_data)
      end
    end
  end
end 