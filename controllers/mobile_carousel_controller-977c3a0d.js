import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper'
import { Navigation, Pagination, Autoplay } from 'swiper/modules'

export default class extends Controller {
  connect() {
    // Initialiser Swiper uniquement sur mobile
    if (window.innerWidth < 768) {
      this.initSwiper()
    }

    // Écouter les changements de taille d'écran
    window.addEventListener('resize', () => this.handleResize())
  }

  disconnect() {
    if (this.swiper) {
      this.swiper.destroy()
    }
    window.removeEventListener('resize', () => this.handleResize())
  }

  handleResize() {
    if (window.innerWidth < 768) {
      if (!this.swiper) {
        this.initSwiper()
      }
    } else {
      if (this.swiper) {
        this.swiper.destroy()
        this.swiper = null
      }
    }
  }

  initSwiper() {
    this.swiper = new Swiper(this.element, {
      modules: [Navigation, Pagination, Autoplay],
      slidesPerView: 1,
      spaceBetween: 20,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      loop: true
    })
  }
} 