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

  def render_service_icon(service_name, classes)
    case service_name.downcase
    when /tıkanıklık/
      render_icon("M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4", classes)
    when /kaçak/
      render_icon("M13 10V3L4 14h7v7l9-11h-7z", classes)
    when /boya/
      render_icon("M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01", classes)
    else
      render_icon("M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4", classes)
    end
  end

  private

  def render_icon(path, classes)
    content_tag :svg, class: "service-icon #{classes}", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
      content_tag :path, nil, "stroke-linecap": "round", "stroke-linejoin": "round", "stroke-width": "2", d: path
    end
  end
end 