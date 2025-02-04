class ServicePreview
  include ActiveModel::Model

  attr_accessor :name, :description, :category, :urgent, :available_24h,
                :first_image, :service_advantages, :advantages

  def self.create(attributes)
    # Convertir les clés de string en symbol pour la compatibilité
    attributes = attributes.transform_keys(&:to_sym)

    # Gérer la conversion des advantages en service_advantages si nécessaire
    if attributes[:advantages].present? && attributes[:service_advantages].nil?
      attributes[:service_advantages] = build_service_advantages(attributes.delete(:advantages))
    end

    new(attributes)
  end

  def self.build_service_advantages(advantages)
    advantages.map { |adv| ServiceAdvantagePreview.create(adv.transform_keys(&:to_sym)) }
  end
end
