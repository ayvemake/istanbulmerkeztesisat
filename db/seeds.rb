# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Créer des services de plomberie
services_data = [
  {
    name: 'Su Tesisatı Onarımı',
    description: 'Profesyonel su tesisatı kurulum ve onarım hizmetleri',
    category: :plomberie_generale,
    price: 250.00,
    active: true
  },
  {
    name: 'Kalorifer Sistemi Bakımı',
    description: 'Komple kalorifer sistemi bakım ve onarım hizmetleri',
    category: :chauffage,
    price: 350.00,
    active: true
  },
  {
    name: 'Klima Montajı',
    description: 'Merkezi ve split klima sistemleri kurulumu',
    category: :climatisation,
    price: 500.00,
    active: true
  },
  {
    name: 'Acil Tesisat Müdahalesi',
    description: '7/24 acil tesisat arıza ve müdahale hizmeti',
    category: :urgence,
    price: 400.00,
    active: true
  }
]

services_data.each do |service_attrs|
  Service.find_or_create_by!(name: service_attrs[:name]) do |service|
    service.update!(service_attrs)
  end
end

puts "Services créés avec succès !"

# Team Members
team_members_data = [
  {
    name: 'Mehmet Yılmaz',
    role: 'Genel Müdür',
    bio: 'Tesisat sektöründe 20 yılı aşkın deneyime sahip profesyonel yönetici.',
    avatar: 'mehmet_yilmaz.jpg'
  },
  {
    name: 'Ayşe Demir',
    role: 'Teknik Direktör',
    bio: 'Mühendislik alanında uzman, yenilikçi tesisat çözümleri geliştiren lider.',
    avatar: 'ayse_demir.jpg'
  }
]

team_members_data.each do |member_attrs|
  TeamMember.find_or_create_by!(name: member_attrs[:name]) do |member|
    member.update!(member_attrs)
  end
end

# Service Areas
service_areas_data = [
  {
    name: 'Kadıköy',
    postal_code: '34700',
    description: 'Kadıköy ve çevre ilçelerde profesyonel tesisat hizmetleri.'
  },
  {
    name: 'Beşiktaş',
    postal_code: '34300',
    description: 'Beşiktaş ve çevresinde güvenilir tesisat çözümleri.'
  }
]

service_areas_data.each do |area_attrs|
  ServiceArea.find_or_create_by!(name: area_attrs[:name]) do |area|
    area.update!(area_attrs)
  end
end
