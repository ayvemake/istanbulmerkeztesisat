function showHomeService(name, description, type) {
  const modal = document.getElementById('home-modal');
  const serviceUrl = type === 'tesisat' ? '/hizmetler?category=tesisat' : '/hizmetler?category=boya';
  
  const content = `
    <div class="inline-block w-full max-w-4xl bg-white rounded-2xl shadow-xl transform transition-all">
      <!-- Header avec Slider -->
      <div class="relative h-72">
        <div class="swiper-container h-full">
          <div class="swiper-wrapper">
            ${type === 'tesisat' ? `
              <div class="swiper-slide"><img src="/assets/services/sanitary1.webp" class="w-full h-full object-cover" alt="Tesisat 1"></div>
              <div class="swiper-slide"><img src="/assets/services/sanitary2.webp" class="w-full h-full object-cover" alt="Tesisat 2"></div>
              <div class="swiper-slide"><img src="/assets/services/sanitary3.webp" class="w-full h-full object-cover" alt="Tesisat 3"></div>
            ` : `
              <div class="swiper-slide"><img src="/assets/services/paint1.webp" class="w-full h-full object-cover" alt="Boya 1"></div>
              <div class="swiper-slide"><img src="/assets/services/paint2.webp" class="w-full h-full object-cover" alt="Boya 2"></div>
              <div class="swiper-slide"><img src="/assets/services/paint3.webp" class="w-full h-full object-cover" alt="Boya 3"></div>
            `}
          </div>
          <div class="swiper-pagination"></div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </div>
      </div>

      <!-- Content -->
      <div class="p-8">
        <h2 class="text-3xl font-bold text-gray-900 mb-4">${name}</h2>
        <p class="text-gray-600 text-lg mb-8">${description}</p>

        <!-- Galerie de miniatures -->
        <div class="grid grid-cols-3 gap-4 mb-8">
          ${type === 'tesisat' ? `
            <img src="/assets/services/sanitary1.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
            <img src="/assets/services/sanitary2.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
            <img src="/assets/services/sanitary3.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
          ` : `
            <img src="/assets/services/paint1.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
            <img src="/assets/services/paint2.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
            <img src="/assets/services/paint3.webp" class="rounded-lg cursor-pointer hover:opacity-75 transition-opacity" onclick="showFullImage(this.src)">
          `}
        </div>

        <!-- Actions -->
        <div class="flex items-center justify-between pt-6 border-t border-gray-200">
          <a href="${serviceUrl}" 
             class="inline-flex items-center px-6 py-3 bg-emerald-600 text-white text-lg font-medium rounded-lg hover:bg-emerald-700 transition-colors">
            <span>Tüm ${type === 'tesisat' ? 'Tesisat' : 'Boya'} Hizmetleri</span>
            <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
            </svg>
          </a>

          <a href="tel:+905555555555" 
             class="inline-flex items-center px-6 py-3 border-2 border-emerald-600 text-emerald-600 text-lg font-medium rounded-lg hover:bg-emerald-50 transition-colors">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
            </svg>
            Hemen Ara
          </a>
        </div>
      </div>

      <!-- Close Button -->
      <button onclick="closeHomeModal()" class="absolute top-4 right-4 text-white hover:text-gray-200">
        <span class="sr-only">Kapat</span>
        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
        </svg>
      </button>
    </div>
  `;

  modal.querySelector('div').innerHTML = content;
  modal.classList.remove('hidden');
  document.body.style.overflow = 'hidden';

  // Initialize Swiper
  new Swiper('.swiper-container', {
    loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    }
  });
}

function closeHomeModal() {
  const modal = document.getElementById('home-modal');
  modal.classList.add('hidden');
  document.body.style.overflow = '';
}

document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('home-modal');
  if (modal) {
    modal.addEventListener('click', function(e) {
      if (e.target === this) {
        closeHomeModal();
      }
    });
  }
}); 