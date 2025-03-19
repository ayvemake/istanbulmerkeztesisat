require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://votre-domaine.com'

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'weekly', priority: 1.0
  add about_path, changefreq: 'monthly', priority: 0.8
  add contact_path, changefreq: 'monthly', priority: 0.8
  
  # Ajoutez d'autres pages importantes
  Service.find_each do |service|
    add service_path(service), changefreq: 'monthly', priority: 0.9
  end
end
