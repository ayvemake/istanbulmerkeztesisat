import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image"]

  connect() {
    if ("IntersectionObserver" in window) {
      this.observer = new IntersectionObserver(this.handleIntersect.bind(this))
      this.observer.observe(this.imageTarget)
    }
  }

  handleIntersect(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        this.loadImage()
        this.observer.unobserve(this.imageTarget)
      }
    })
  }

  loadImage() {
    const src = this.imageTarget.dataset.src
    if (src) {
      this.imageTarget.src = src
      this.imageTarget.classList.add('fade-in')
    }
  }
} 