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
    when 'painting'
      'Boya ve Dekorasyon'
    when 'plumbing'
      'Su ve Tesisat'
    else
      service.category.titleize
    end
  end
end 