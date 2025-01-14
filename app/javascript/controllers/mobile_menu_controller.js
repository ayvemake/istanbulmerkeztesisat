import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "overlay"]

  connect() {
    // Empêcher le scroll sur iOS quand le menu est ouvert
    document.addEventListener('touchmove', this.handleTouchMove.bind(this), { passive: false })
  }

  disconnect() {
    document.removeEventListener('touchmove', this.handleTouchMove.bind(this))
  }

  toggle(event) {
    event.preventDefault()
    const isOpen = this.menuTarget.classList.contains('translate-x-0')
    
    if (isOpen) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    this.menuTarget.classList.remove('translate-x-full')
    this.menuTarget.classList.add('translate-x-0')
    this.overlayTarget.classList.remove('opacity-0', 'pointer-events-none')
    document.body.style.overflow = 'hidden'
  }

  close() {
    this.menuTarget.classList.remove('translate-x-0')
    this.menuTarget.classList.add('translate-x-full')
    this.overlayTarget.classList.add('opacity-0', 'pointer-events-none')
    document.body.style.overflow = ''
  }

  handleTouchMove(event) {
    if (this.menuTarget.classList.contains('translate-x-0')) {
      event.preventDefault()
    }
  }
} 