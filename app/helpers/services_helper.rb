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
      service.category == 'tesisat' ? 'plumbing-default.jpg' : 'painting-default.jpg'
    end
  end

  def service_tags(service)
    tags = []
    tags << "urgent" if service.urgent?
    tags << "24/7" if service.available_24_7?
    tags << "warranty" if service.warranty?
    tags
  end
end 