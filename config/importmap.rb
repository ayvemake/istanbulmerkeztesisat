# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tailwindcss", to: "tailwindcss.js"
pin "el-transition", to: "https://cdn.jsdelivr.net/npm/el-transition@0.0.7/index.js"
pin "photoswipe", to: "https://ga.jspm.io/npm:photoswipe@5.3.7/dist/photoswipe.esm.js"
pin "photoswipe/lightbox", to: "https://ga.jspm.io/npm:photoswipe@5.3.7/dist/photoswipe-lightbox.esm.js"
