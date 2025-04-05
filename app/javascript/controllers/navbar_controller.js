import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition"

export default class extends Controller {
  static targets = ["menu", "menuIcon", "overlay"]
  static values = {
    open: { type: Boolean, default: false }
  }

  connect() {
    this.initialize()
    
    // Écouter les événements Turbo
    document.addEventListener('turbo:before-cache', this.cleanup.bind(this))
    document.addEventListener('turbo:render', this.initialize.bind(this))
  }

  initialize() {
    // Réinitialiser l'état
    this.isTransitioning = false
    this.openValue = false
    
    // Nettoyer d'abord
    this.cleanup()
    
    // Initialiser les écouteurs
    this.boundHandleClickOutside = this.handleClickOutside.bind(this)
    this.boundHandleKeydown = this.handleKeydown.bind(this)
    
    document.addEventListener('click', this.boundHandleClickOutside)
    document.addEventListener('keydown', this.boundHandleKeydown)
  }

  cleanup() {
    if (this.boundHandleClickOutside) {
      document.removeEventListener('click', this.boundHandleClickOutside)
    }
    if (this.boundHandleKeydown) {
      document.removeEventListener('keydown', this.boundHandleKeydown)
    }
    
    // S'assurer que le menu est fermé
    this.closeMenu()
    
    // Réinitialiser les états
    this.isTransitioning = false
    this.openValue = false
  }

  handleKeydown(event) {
    if (event.key === 'Escape' && this.openValue) {
      this.closeMenu()
    }
  }

  handleClickOutside(event) {
    if (this.openValue && !this.element.contains(event.target)) {
      this.closeMenu()
    }
  }

  toggle(event) {
    event.preventDefault()
    // Empêcher les clics multiples rapides
    if (this.isTransitioning) return
    this.isTransitioning = true
    
    this.openValue ? this.closeMenu() : this.openMenu()
    
    // Réinitialiser l'état de transition après l'animation
    setTimeout(() => {
      this.isTransitioning = false
    }, 300)
  }

  closeMenu() {
    if (!this.menuTarget) return
    
    this.menuTarget.classList.add("hidden")
    this.openValue = false
    leave(this.menuTarget)
    leave(this.overlayTarget)
    document.body.classList.remove('overflow-hidden')
    
    // Réinitialiser le focus
    const menuButton = this.element.querySelector('button')
    if (menuButton) menuButton.focus()
  }

  openMenu() {
    if (!this.menuTarget) return
    
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

  disconnect() {
    // Nettoyer tous les écouteurs d'événements
    document.removeEventListener('turbo:before-cache', this.cleanup.bind(this))
    document.removeEventListener('turbo:render', this.initialize.bind(this))
    this.cleanup()
  }
} 