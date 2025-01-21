function showServiceDetails(name, description, image) {
  const modal = document.getElementById('service-modal');
  const content = `
    <div class="inline-block w-full max-w-4xl bg-white rounded-2xl shadow-xl transform transition-all">
      <!-- Header -->
      <div class="relative h-72">
        <img src="${image}" class="w-full h-full object-cover rounded-t-2xl" alt="${name}">
        <div class="absolute inset-0 bg-gradient-to-t from-black/75 to-transparent rounded-t-2xl"></div>
        <div class="absolute bottom-0 left-0 p-8">
          <h3 class="text-3xl font-bold text-white mb-2">${name}</h3>
        </div>
      </div>

      <!-- Content -->
      <div class="p-8">
        <!-- Description principale -->
        <div class="prose max-w-none mb-8">
          <p class="text-gray-600 text-lg leading-relaxed">${description}</p>
          
          <!-- Détails du service -->
          <div class="mt-8">
            <h4 class="text-xl font-semibold text-gray-900 mb-4">Hizmet Detayları</h4>
            <!-- ... reste du contenu ... -->
          </div>
        </div>

        <!-- Actions -->
        <div class="flex items-center justify-end space-x-4 pt-6 border-t border-gray-200">
          <a href="/contact/new?service=${encodeURIComponent(name)}" 
             class="inline-flex items-center px-6 py-3 bg-emerald-600 text-white text-lg font-medium rounded-lg hover:bg-emerald-700 transition-colors">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 4H6a2 2 0 00-2 2v12a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-2m-4-1v8m0 0l3-3m-3 3L9 8"/>
            </svg>
            Teklif Al
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
      <button onclick="closeServiceModal()" class="absolute top-4 right-4 text-white hover:text-gray-200">
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