import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "overlay"]

  connect() {
    // S'assurer que le menu est fermé au démarrage
    this.closeMenu()
  }

  toggle() {
    if (this.menuTarget.classList.contains("translate-x-full")) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.classList.remove("translate-x-full")
    this.menuTarget.classList.add("translate-x-0")
    this.overlayTarget.classList.remove("opacity-0", "pointer-events-none")
    this.overlayTarget.classList.add("opacity-100")
    document.body.style.overflow = 'hidden' // Empêcher le défilement
  }

  closeMenu() {
    this.menuTarget.classList.remove("translate-x-0")
    this.menuTarget.classList.add("translate-x-full")
    this.overlayTarget.classList.remove("opacity-100")
    this.overlayTarget.classList.add("opacity-0", "pointer-events-none")
    document.body.style.overflow = '' // Réactiver le défilement
  }

  // Fermer le menu si on clique sur l'overlay
  clickOutside(event) {
    if (event.target === this.overlayTarget) {
      this.closeMenu()
    }
  }

  // Fermer le menu quand on clique sur un lien
  closeOnNavigation() {
    this.closeMenu()
  }
} 