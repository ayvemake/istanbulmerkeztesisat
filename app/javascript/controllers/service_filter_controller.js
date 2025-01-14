import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "category", "serviceList" ]

  filter() {
    const selectedCategory = this.categoryTarget.value
    
    this.serviceListTarget.querySelectorAll('[data-category]').forEach(service => {
      const serviceCategory = service.dataset.category
      service.hidden = selectedCategory !== 'all' && serviceCategory !== selectedCategory
    })
  }
} 