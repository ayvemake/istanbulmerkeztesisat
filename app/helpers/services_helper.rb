module ServicesHelper
  def service_image_url(service)
    if service.image_url.present?
      service.image_url
    else
      "https://placehold.co/600x400/e2e8f0/64748b?text=#{URI.encode_www_form_component(service.name)}"
    end
  end

  def display_category(service)
    return 'Kategori Belirtilmemiş' if service.category.nil?
    
    case service.category
    when 'tesisat'
      'Su ve Tesisat'
    when 'boya'
      'Boya ve Dekorasyon'
    else
      service.category.titleize
    end
  end

  def service_image(service)
    if service.image.attached?
      service.image
    else
      # Image par défaut basée sur la catégorie
      service.category == 'tesisat' ? 'services/sanitary1.webp' : 'services/paint1.webp'
    end
  end

  def service_tags(service)
    tags = []
    tags << "urgent" if service.urgent?
    tags << "24/7" if service.available_24_7?
    tags << "warranty" if service.warranty?
    tags.to_json
  end

  def category_color(category)
    case category
    when 'tesisat'
      'emerald'
    when 'boya'
      'amber'
    else
      'gray'
    end
  end

  def service_badge_class(type)
    case type
    when 'urgent'
      'bg-red-100 text-red-800'
    when '24/7'
      'bg-emerald-100 text-emerald-800'
    when 'warranty'
      'bg-blue-100 text-blue-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end
end 