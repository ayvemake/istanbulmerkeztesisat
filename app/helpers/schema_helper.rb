module SchemaHelper
  def service_schema_json(service)
    {
      "@context": "https://schema.org",
      "@type": "Service",
      "name": service.name,
      "description": service.description,
      "provider": {
        "@type": "LocalBusiness",
        "name": "İstanbul Tesisat",
        "address": {
          "@type": "PostalAddress",
          "addressLocality": "İstanbul",
          "addressCountry": "TR"
        }
      }
    }.to_json.html_safe
  end
end 