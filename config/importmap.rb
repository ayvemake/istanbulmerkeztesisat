# Pin npm packages by running ./bin/importmap

pin '@hotwired/turbo-rails', to: 'https://ga.jspm.io/npm:@hotwired/turbo-rails@7.3.0/app/javascript/turbo/index.js'
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

# Application
pin 'application', preload: true

# Controllers
pin 'controllers/application', to: 'controllers/application.js'
pin 'controllers/dropdown_controller', to: 'controllers/dropdown_controller.js'
pin 'controllers/lazy_image_controller', to: 'controllers/lazy_image_controller.js'
pin 'controllers/mobile_menu_controller', to: 'controllers/mobile_menu_controller.js'
pin 'controllers/navbar_controller', to: 'controllers/navbar_controller.js'
pin 'controllers/photoswipe_controller', to: 'controllers/photoswipe_controller.js'
pin 'controllers/water_effect_controller', to: 'controllers/water_effect_controller.js'
pin 'controllers/whatsapp_controller', to: 'controllers/whatsapp_controller.js'

# External dependencies
pin 'photoswipe', to: 'https://ga.jspm.io/npm:photoswipe@5.3.7/dist/photoswipe.esm.js'
pin 'photoswipe/lightbox', to: 'https://ga.jspm.io/npm:photoswipe@5.3.7/dist/photoswipe-lightbox.esm.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@7.1.0/app/assets/javascripts/activestorage.esm.js'
pin '@rails/actioncable', to: 'https://ga.jspm.io/npm:@rails/actioncable@7.1.0/app/assets/javascripts/actioncable.esm.js'
