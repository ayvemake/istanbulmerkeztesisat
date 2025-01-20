import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "section", "searchInput", "serviceCard"]
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

  search(event) {
    const searchTerm = event.target.value.toLowerCase()
    
    this.serviceCardTargets.forEach(card => {
      const title = card.querySelector('h3').textContent.toLowerCase()
      const description = card.querySelector('p').textContent.toLowerCase()
      
      const matches = title.includes(searchTerm) || description.includes(searchTerm)
      card.classList.toggle('hidden', !matches)
    })
  }

  filterByTag(event) {
    const tag = event.currentTarget.dataset.tag
    const isActive = event.currentTarget.classList.toggle('bg-emerald-100')
    
    this.serviceCardTargets.forEach(card => {
      const tags = JSON.parse(card.dataset.tags)
      if (isActive) {
        card.classList.toggle('hidden', !tags.includes(tag))
      } else {
        card.classList.remove('hidden')
      }
    })
  }
} 