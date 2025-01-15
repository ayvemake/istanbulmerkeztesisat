SitemapGenerator::Sitemap.default_host = "https://votre-domaine.com"

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily', priority: 1.0
  add services_path, changefreq: 'weekly', priority: 0.9
  add about_path, changefreq: 'monthly', priority: 0.8
  
  Service.find_each do |service|
    add service_path(service), 
        lastmod: service.updated_at,
        changefreq: 'weekly',
        priority: 0.8
  end
end 