import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "content"]

  connect() {
    this.currentImageIndex = 0
    this.modalImages = null
  }

  showCategory(event) {
    const category = event.params.category
    // Cacher tous les contenus
    document.querySelectorAll('.service-content').forEach(content => {
      content.classList.add('hidden')
    })
    
    // Afficher le contenu sélectionné
    document.getElementById(category + '-services').classList.remove('hidden')
    
    // Mettre à jour les styles des boutons
    document.querySelectorAll('.tab-button').forEach(button => {
      button.classList.remove('active')
    })
    event.currentTarget.classList.add('active')
  }

  showServiceType(event) {
    const type = event.params.type
    // Mise à jour des boutons
    document.querySelectorAll('.service-btn').forEach(btn => btn.classList.remove('active'))
    document.querySelector(`.${type}-btn`).classList.add('active')
    
    // Mise à jour des cartes
    document.querySelectorAll('.service-card').forEach(card => card.classList.remove('active'))
    document.getElementById(`${type}-card`).classList.add('active')
  }

  showModal() {
    this.modalTarget.classList.remove('hidden')
    document.body.style.overflow = 'hidden'
  }

  hideModal() {
    this.modalTarget.classList.add('hidden')
    document.body.style.overflow = ''
  }

  // ... autres méthodes pour la galerie d'images ...
} 