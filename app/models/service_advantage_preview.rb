class ServiceAdvantagePreview
  include ActiveModel::Model

  attr_accessor :title, :description

  def self.create(attributes)
    new(attributes)
  end
end
