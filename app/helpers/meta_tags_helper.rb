module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : default_meta_title
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : default_meta_description
  end

  private

  def default_meta_title
    "İstanbul Merkez Tesisat | Su Tesisatı ve Tıkanıklık Açma Hizmetleri"
  end

  def default_meta_description
    "İstanbul'da profesyonel su tesisatı, tıkanıklık açma, kaçak tespiti ve petek temizleme hizmetleri. 7/24 acil tesisat servisi. ☎ 0546 682 96 86"
  end
end 