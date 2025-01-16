import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]

  showDetails(event) {
    const step = event.currentTarget
    step.classList.add('z-30')
  }

  hideDetails(event) {
    const step = event.currentTarget
    step.classList.remove('z-30')
  }
} 