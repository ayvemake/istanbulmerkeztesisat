class ServiceAdvantagePreview
  include ActiveModel::Model

  attr_accessor :title, :description

  def initialize(attributes = {})
    super
  end

  def self.create(attributes)
    new(attributes)
  end
end
