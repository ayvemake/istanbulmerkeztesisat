class ServiceReviewPreview
  include ActiveModel::Model

  attr_accessor :name, :content, :rating, :created_at, :image_url

  def self.create(attributes)
    new(attributes)
  end
end
