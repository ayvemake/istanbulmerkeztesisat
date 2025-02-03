import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition"

export default class extends Controller {
  static targets = ["menu", "menuIcon", "overlay"]

  connect() {
    this.isOpen = false
  }

  toggleMenu(event) {
    event.preventDefault()
    
    if (this.isOpen) {
      this.closeMenu()
    } else {
      this.openMenu()
    }
    
    this.isOpen = !this.isOpen
    this.updateIcon()
  }

  openMenu() {
    enter(this.menuTarget)
    enter(this.overlayTarget)
    document.body.classList.add('overflow-hidden')
  }

  closeMenu() {
    leave(this.menuTarget)
    leave(this.overlayTarget)
    document.body.classList.remove('overflow-hidden')
  }

  updateIcon() {
    this.menuIconTarget.innerHTML = this.isOpen
      ? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />'
      : '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />'
  }

  scrollToContact(event) {
    event.preventDefault()
    
    // Si nous ne sommes pas sur la page d'accueil, redirigeons d'abord
    if (window.location.pathname !== '/') {
      window.location.href = '/#iletisim'
      return
    }
    
    const contactSection = document.getElementById('iletisim')
    if (contactSection) {
      contactSection.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      })
    }
  }
} 