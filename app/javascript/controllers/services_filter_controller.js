import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "section"]
  static values = { category: String }

  connect() {
    if (this.categoryValue) {
      this.filterServices(this.categoryValue)
    } else {
      this.filterServices('all')
    }
  }

  filter(event) {
    const category = event.currentTarget.dataset.category
    this.filterServices(category)
    
    // Mettre à jour l'URL sans recharger la page
    const url = new URL(window.location)
    if (category === 'all') {
      url.searchParams.delete('category')
    } else {
      url.searchParams.set('category', category)
    }
    window.history.pushState({}, '', url)
  }

  filterServices(category) {
    // Mettre à jour les boutons
    this.buttonTargets.forEach(button => {
      const isActive = button.dataset.category === category
      button.classList.toggle('bg-emerald-50', isActive)
      button.classList.toggle('text-emerald-600', isActive)
      button.classList.toggle('text-gray-600', !isActive)
    })

    // Afficher/masquer les sections
    this.sectionTargets.forEach(section => {
      const shouldShow = category === 'all' || section.dataset.category === category
      section.classList.toggle('hidden', !shouldShow)
    })
  }
} 