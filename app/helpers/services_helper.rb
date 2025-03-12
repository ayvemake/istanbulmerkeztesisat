module ServicesHelper
  def service_image_url(service)
    service.image_url.presence || "https://placehold.co/600x400/e2e8f0/64748b?text=#{URI.encode_www_form_component(service.name)}"
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
      case service.category
      when 'tesisat'
        'sanitary/general/general1.webp'
      when 'boya'
        'paint/renovate/renovate1.webp'
      end
    end
  end

  def service_gallery_images(service)
    if service.gallery_images.attached?
      service.gallery_images
    else
      case service.category
      when 'tesisat'
        ['sanitary/general/general1.webp', 'sanitary/general/general2.webp', 'sanitary/general/general3.webp']
      when 'boya'
        ['paint/renovate/renovate1.webp', 'paint/renovate/renovate2.webp', 'paint/renovate/renovate3.webp']
      end
    end
  end

  def service_tags(service)
    tags = []
    tags << 'urgent' if service.urgent?
    tags << '24/7' if service.available_24_7?
    tags << 'warranty' if service.warranty?
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

  def render_service_icon(service_name, classes)
    path = service_icon_path(service_name)
    render_icon(path, classes)
  end

  private

  def render_icon(path, classes)
    content_tag :svg, class: "service-icon #{classes}", fill: 'none', stroke: 'currentColor', viewBox: '0 0 24 24' do
      content_tag :path, nil, 'stroke-linecap': 'round', 'stroke-linejoin': 'round', 'stroke-width': '2', d: path
    end
  end

  def service_icon_path(service_name)
    case service_name.downcase
    when /tıkanıklık/ then tikaniklik_icon_path
    when /kaçak/ then kacak_icon_path
    when /boya/ then boya_icon_path
    else default_icon_path
    end
  end

  def tikaniklik_icon_path
    'M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 ' \
      '7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4'
  end

end
