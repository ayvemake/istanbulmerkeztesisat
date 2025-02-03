function showServiceDetails(name, description, type) {
  const modal = document.getElementById('service-modal');
  const getServiceImages = (serviceName, type) => {
    if (type === 'tesisat') {
      return [
        '/assets/sanitary/general/general1.webp',
        '/assets/sanitary/general/general2.webp',
        '/assets/sanitary/general/general3.webp'
      ];
    } else {
      return [
        '/assets/paint/renovate/renovate1.webp',
        '/assets/paint/renovate/renovate2.webp',
        '/assets/paint/renovate/renovate3.webp'
      ];
    }
  };

  const images = getServiceImages(name, type);
  
  const content = `
    <div class="swiper-container">
      <div class="swiper-wrapper">
        ${images.map(img => `
          <div class="swiper-slide">
            <img src="${img}" class="w-full h-full object-cover" alt="${name}">
          </div>
        `).join('')}
      </div>
      <!-- ... -->
    </div>
  `;

  modal.querySelector('div').innerHTML = content;
  modal.classList.remove('hidden');
  document.body.style.overflow = 'hidden';
}

function closeServiceModal() {
  const modal = document.getElementById('service-modal');
  modal.classList.add('hidden');
  document.body.style.overflow = '';
}

document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('service-modal');
  if (modal) {
    modal.addEventListener('click', function(e) {
      if (e.target === this) {
        closeServiceModal();
      }
    });
  }
});

// Mise à jour des miniatures
const thumbnails = service.category === 'tesisat' ? 
  [
    '/assets/sanitary/general/general1.webp',
    '/assets/sanitary/general/general2.webp',
    '/assets/sanitary/general/general3.webp'
  ] : [
    '/assets/paint/renovate/renovate1.webp',
    '/assets/paint/renovate/renovate2.webp',
    '/assets/paint/renovate/renovate3.webp'
  ];

function getServiceSubType(serviceName) {
  const name = serviceName.toLowerCase();
  if (name.includes('tıkanıklık')) return 'unblock';
  if (name.includes('kalorifer') || name.includes('petek')) return 'thermal';
  return null;
} 