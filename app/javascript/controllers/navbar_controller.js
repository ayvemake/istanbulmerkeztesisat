import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "menuIcon"]

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
    
    // Change l'icône du menu
    const isOpen = !this.menuTarget.classList.contains("hidden")
    this.menuIconTarget.innerHTML = isOpen 
      ? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />'
      : '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />'
  }
} 