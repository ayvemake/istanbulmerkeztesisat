import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator", "container"]
  static values = { 
    current: Number,
    autoplay: { type: Boolean, default: true },
    interval: { type: Number, default: 5000 }
  }

  connect() {
    console.log("Carousel connected")
    console.log("Slides:", this.slideTargets.map(slide => slide.src))
    console.log("Indicators:", this.indicatorTargets)
    
    if (this.autoplayValue) {
      this.startAutoplay()
    }
    this.showSlide(this.currentValue)
  }

  disconnect() {
    this.stopAutoplay()
  }

  next() {
    this.currentValue = (this.currentValue + 1) % this.slideTargets.length
    this.showSlide(this.currentValue)
    this.resetAutoplay()
  }

  previous() {
    this.currentValue = (this.currentValue - 1 + this.slideTargets.length) % this.slideTargets.length
    this.showSlide(this.currentValue)
    this.resetAutoplay()
  }

  select(event) {
    this.currentValue = parseInt(event.currentTarget.dataset.index)
    this.showSlide(this.currentValue)
    this.resetAutoplay()
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, i) => {
      slide.classList.toggle('opacity-0', i !== index)
      slide.classList.toggle('translate-x-0', i === index)
      slide.classList.toggle('translate-x-full', i > index)
      slide.classList.toggle('-translate-x-full', i < index)
    })

    this.indicatorTargets.forEach((indicator, i) => {
      indicator.classList.toggle('bg-emerald-600', i === index)
      indicator.classList.toggle('bg-gray-300', i !== index)
    })
  }

  startAutoplay() {
    this.autoplayInterval = setInterval(() => {
      this.next()
    }, this.intervalValue)
  }

  stopAutoplay() {
    if (this.autoplayInterval) {
      clearInterval(this.autoplayInterval)
    }
  }

  resetAutoplay() {
    this.stopAutoplay()
    if (this.autoplayValue) {
      this.startAutoplay()
    }
  }

  mouseEnter() {
    this.stopAutoplay()
  }

  mouseLeave() {
    if (this.autoplayValue) {
      this.startAutoplay()
    }
  }
} 