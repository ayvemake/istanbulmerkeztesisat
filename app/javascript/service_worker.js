const CACHE_VERSION = 'v1';
const CACHE_NAME = `istanbul-tesisat-${CACHE_VERSION}`;

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll([
        '/',
        '/offline.html',
        '/assets/application.css',
        '/assets/application.js'
      ]);
    })
  );
}); 