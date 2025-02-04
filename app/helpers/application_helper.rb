module ApplicationHelper
  def meta_title(title = nil)
    content_for(:meta_title) { title } if title.present?
    content_for(:meta_title) || 'İstanbul Tesisat Hizmetleri | Profesyonel Tesisat Çözümleri'
  end

  def meta_description(desc = nil)
    content_for(:meta_description) { desc } if desc.present?
    content_for(:meta_description) || default_meta_description
  end

  def asset_exists?(path)
    Rails.root.join('app', 'assets', 'images', path).exist?
  end

  private

  def default_meta_description
    "İstanbul'da 7/24 profesyonel tesisat, su kaçağı tespiti, " \
      'tıkanıklık açma ve tadilat hizmetleri. 20 yıllık tecrübe.'
  end
end
