import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.fadeOut()
  }

  fadeOut() {
    setTimeout(() => {
      this.messageTarget.classList.add('opacity-0', 'transition-opacity', 'duration-500')
      setTimeout(() => {
        this.messageTarget.remove()
      }, 500)
    }, 5000)
  }

  close() {
    this.messageTarget.remove()
  }
} 