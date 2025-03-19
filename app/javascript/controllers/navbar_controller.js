import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition"

export default class extends Controller {
  static targets = ["menu", "menuIcon", "overlay"]
  static values = {
    open: { type: Boolean, default: false }
  }

  connect() {
    // Reset state on page load/navigation
    this.closeMenu()
  }

  toggle() {
    this.openValue ? this.closeMenu() : this.openMenu()
  }

  closeMenu() {
    this.menuTarget.classList.add("hidden")
    this.openValue = false
    leave(this.menuTarget)
    leave(this.overlayTarget)
    document.body.classList.remove('overflow-hidden')
  }

  openMenu() {
    this.menuTarget.classList.remove("hidden")
    this.openValue = true
    enter(this.menuTarget)
    enter(this.overlayTarget)
    document.body.classList.add('overflow-hidden')
  }

  updateIcon() {
    this.menuIconTarget.innerHTML = this.openValue
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

  // Ferme le menu si on clique en dehors
  clickOutside(event) {
    if (!this.element.contains(event.target) && this.openValue) {
      this.closeMenu()
    }
  }

  disconnect() {
    // Nettoyage lors de la déconnexion du contrôleur
    this.closeMenu()
  }
} 