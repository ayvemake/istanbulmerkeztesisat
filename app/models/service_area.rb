class ServiceArea
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :districts, default: []
  attribute :description, :string
  attribute :postal_code, :string

  validates :name, presence: true
  validates :districts, presence: true

  def self.all
    @areas ||= begin
      [
        new(
          name: 'İstanbul Avrupa Yakası',
          districts: ['Bakırköy'],
          description: 'Cevizlik Mahallesi, Kartopu Sokak No:29/A, Bakırköy\'de hizmet vermekteyiz',
          postal_code: '34142'
        ),
        new(
          name: 'İstanbul Anadolu Yakası',
          districts: ['Kadıköy', 'Üsküdar', 'Ataşehir', 'Maltepe', 'Kartal', 'Pendik'],
          description: 'İstanbul Anadolu yakasında tüm ilçelere hizmet vermekteyiz',
          postal_code: '34700'
        )
      ]
    end
  end
end 