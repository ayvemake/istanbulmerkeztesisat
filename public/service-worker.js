// Service Worker pour Istanbul Merkez Tesisat
const CACHE_NAME = 'istanbul-tesisat-cache-v1';
const urlsToCache = [
  '/',
  '/assets/application.tailwind.css',
  '/assets/application.js'
];

// Installation du service worker
self.addEventListener('install', event => {
  self.skipWaiting();
  event.waitUntil(
    caches.open('v1').then(cache => {
      return cache.addAll([
        '/',
        '/assets/application.css',
        '/assets/application.js'
      ]);
    })
  );
});

// Stratégie de cache : network first, puis cache
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});

// Nettoyage des anciens caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.filter(cacheName => {
          return cacheName !== 'v1';
        }).map(cacheName => {
          return caches.delete(cacheName);
        })
      );
    })
  );
}); 