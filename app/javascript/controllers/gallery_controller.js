import { Controller } from "@hotwired/stimulus"
import PhotoSwipe from 'photoswipe'
import PhotoSwipeUI_Default from 'photoswipe/dist/photoswipe-ui-default'

export default class extends Controller {
  static values = {
    images: Array
  }

  static targets = ["mainImage", "thumbnail"]

  connect() {
    this.initPhotoSwipe()
  }

  showImage(event) {
    event.preventDefault()
    const clickedImage = event.currentTarget
    const index = this.thumbnailTargets.indexOf(clickedImage)
    
    // Mettre à jour l'image principale
    this.mainImageTarget.src = this.imagesValue[index].large
    
    // Ouvrir PhotoSwipe si cliqué sur l'image principale
    if (clickedImage === this.mainImageTarget) {
      this.openPhotoSwipe(index)
    }
  }

  initPhotoSwipe() {
    const pswpElement = document.querySelector('.pswp')
    
    const items = this.imagesValue.map(image => ({
      src: image.large,
      w: image.width,
      h: image.height,
      msrc: image.thumbnail
    }))

    const options = {
      index: 0,
      history: false,
      focus: false,
      showAnimationDuration: 250,
      hideAnimationDuration: 250,
      shareEl: false,
      closeOnScroll: false
    }

    this.gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)
  }

  openPhotoSwipe(index = 0) {
    this.gallery.options.index = index
    this.gallery.init()
  }

  disconnect() {
    if (this.gallery) {
      this.gallery.close()
      this.gallery = null
    }
  }
} 