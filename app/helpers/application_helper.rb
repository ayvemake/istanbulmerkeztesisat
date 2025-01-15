module ApplicationHelper
  def meta_title(title = nil)
    content_for(:meta_title, title) || "İstanbul Tesisat Hizmetleri | Profesyonel Tesisat Çözümleri"
  end

  def meta_description(desc = nil)
    content_for(:meta_description, desc) || "İstanbul'da 7/24 profesyonel tesisat, su kaçağı tespiti, tıkanıklık açma ve tadilat hizmetleri. 20 yıllık tecrübe."
  end
end
