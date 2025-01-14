import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bar"]
  
  connect() {
    this.lastScrollTop = 0
    this.threshold = 150 // Apparaît après 150px de scroll
  }

  toggleVisibility() {
    const st = window.pageYOffset || document.documentElement.scrollTop
    
    if (st > this.threshold) {
      // Scrolling down & past threshold
      if (st > this.lastScrollTop) {
        this.barTarget.classList.remove('-translate-y-full')
      }
      // Scrolling up
      else {
        this.barTarget.classList.remove('-translate-y-full')
      }
    } else {
      // At the top
      this.barTarget.classList.add('-translate-y-full')
    }
    
    this.lastScrollTop = st
  }
} 