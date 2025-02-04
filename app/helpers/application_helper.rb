module ApplicationHelper
  def meta_title(title = nil)
    content_for(:meta_title, title) || 'İstanbul Tesisat Hizmetleri | Profesyonel Tesisat Çözümleri'
  end

  def meta_description(desc = nil)
    content_for(:meta_description) || default_meta_description(desc)
  end

  def asset_exists?(path)
    Rails.root.join('app', 'assets', 'images', path).exist?
  end

  private

  def default_meta_description(custom_desc = nil)
    custom_desc || build_default_meta_description
  end

  def build_default_meta_description
    "İstanbul'da 7/24 profesyonel tesisat, su kaçağı tespiti, " \
      'tıkanıklık açma ve tadilat hizmetleri. 20 yıllık tecrübe.'
  end
end
