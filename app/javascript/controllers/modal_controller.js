import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    document.addEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
    document.addEventListener('keydown', this.handleKeydown.bind(this))
  }

  disconnect() {
    document.removeEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
    document.removeEventListener('keydown', this.handleKeydown.bind(this))
  }

  handleFrameLoad(event) {
    if (event.target.id === 'modal') {
      this.show()
    }
  }

  show() {
    this.element.classList.remove('hidden')
    document.body.classList.add('overflow-hidden')
  }

  close() {
    this.element.classList.add('hidden')
    document.body.classList.remove('overflow-hidden')
    // Vider le contenu de la modale
    if (this.hasContentTarget) {
      this.contentTarget.innerHTML = ''
    }
  }

  handleKeydown(event) {
    if (event.key === 'Escape') {
      this.close()
    }
  }

  clickOutside(event) {
    if (event.target === this.element) {
      this.close()
    }
  }
} 