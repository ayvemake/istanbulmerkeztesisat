import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slider"]
  
  connect() {
    this.currentIndex = 0
    this.slideCount = this.sliderTarget.children.length
  }
  
  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slideCount
    this.updateSlider()
  }
  
  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.slideCount) % this.slideCount
    this.updateSlider()
  }
  
  updateSlider() {
    this.sliderTarget.style.transform = `translateX(-${this.currentIndex * 100}%)`
  }
} 