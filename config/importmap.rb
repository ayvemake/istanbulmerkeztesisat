# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# Application
pin 'application', preload: true

# Controllers
pin 'controllers/application', to: 'controllers/application.js'
pin 'controllers/dropdown_controller', to: 'controllers/dropdown_controller.js'
pin 'controllers/lazy_image_controller', to: 'controllers/lazy_image_controller.js'
pin 'controllers/mobile_menu_controller', to: 'controllers/mobile_menu_controller.js'
pin 'controllers/navbar_controller', to: 'controllers/navbar_controller.js'
pin 'controllers/whatsapp_controller', to: 'controllers/whatsapp_controller.js'

# External dependencies
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@7.1.0/app/assets/javascripts/activestorage.esm.js'
pin '@rails/actioncable', to: 'https://ga.jspm.io/npm:@rails/actioncable@7.1.0/app/assets/javascripts/actioncable.esm.js'
