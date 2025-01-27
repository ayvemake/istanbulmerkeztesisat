import { Controller } from "@hotwired/stimulus"
import PhotoSwipe from 'photoswipe'
import PhotoSwipeUI_Default from 'photoswipe/dist/photoswipe-ui-default'
import PhotoSwipeLightbox from 'photoswipe/dist/photoswipe-lightbox'

export default class extends Controller {
  static targets = ["image"]

  connect() {
    this.initializeLightbox()
  }

  initializeLightbox() {
    const lightbox = new PhotoSwipeLightbox({
      gallery: '.gallery-grid',
      children: 'a',
      pswpModule: PhotoSwipeLightbox
    })
  }

  openLightbox(event) {
    const image = event.currentTarget
    const fullSizeUrl = image.dataset.full
    const items = this.imageTargets.map(img => ({
      src: img.dataset.full,
      w: 1200,
      h: 800
    }))
    
    const options = {
      index: this.imageTargets.indexOf(image),
      history: false,
      bgOpacity: 0.9,
      showHideOpacity: true
    }

    this.lightbox.open(items, options)
  }

  filterGallery(event) {
    const category = event.currentTarget.dataset.category
    const items = document.querySelectorAll('.gallery-item')
    
    items.forEach(item => {
      if (category === 'all' || item.dataset.category === category) {
        item.classList.remove('hidden')
      } else {
        item.classList.add('hidden')
      }
    })

    // Update active filter
    document.querySelectorAll('.gallery-filter').forEach(btn => {
      btn.classList.remove('bg-blue-800', 'text-white')
      btn.classList.add('text-gray-700', 'hover:bg-blue-50')
    })
    event.currentTarget.classList.add('bg-blue-800', 'text-white')
    event.currentTarget.classList.remove('text-gray-700', 'hover:bg-blue-50')
  }
} 