puts "Création des services..."

# Nettoyage des données existantes
Service.destroy_all

# Services de plomberie
[
  {
    name: 'Su Kaçağı Tespiti',
    description: 'Kameralı cihazlarla su kaçağı tespiti ve tamiri',
    category: 'tesisat'
  },
  {
    name: 'Tuvalet Tamiri',
    description: 'Profesyonel tuvalet ve lavabo tamiri hizmetleri',
    category: 'tesisat'
  }
].each do |service|
  Service.create!(service)
end

# Services de peinture
[
  {
    name: 'İç Cephe Boyama',
    description: 'Profesyonel iç mekan boyama hizmetleri',
    category: 'boya'
  },
  {
    name: 'Dış Cephe Boyama',
    description: 'Dış cephe boya ve mantolama hizmetleri',
    category: 'boya'
  }
].each do |service|
  Service.create!(service)
end

puts "Services créés avec succès !" 