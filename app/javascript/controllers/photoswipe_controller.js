import { Controller } from "@hotwired/stimulus"
import PhotoSwipeLightbox from 'photoswipe/lightbox'

export default class extends Controller {
  connect() {
    const lightbox = new PhotoSwipeLightbox({
      gallery: '#gallery',
      children: 'a',
      pswpModule: () => import('photoswipe')
    })
    lightbox.init()
  }
} 