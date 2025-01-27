import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator"]
  static values = { 
    current: { type: Number, default: 0 },
    interval: { type: Number, default: 5000 }
  }

  connect() {
    this.currentValue = 0
    this.startAutoPlay()
  }

  disconnect() {
    this.stopAutoPlay()
  }

  prev() {
    const prevIndex = (this.currentValue - 1 + this.slideTargets.length) % this.slideTargets.length
    this.showSlide(prevIndex)
  }

  next() {
    const nextIndex = (this.currentValue + 1) % this.slideTargets.length
    this.showSlide(nextIndex)
  }

  showSlide(index) {
    // Masquer l'ancienne slide
    const currentSlide = this.slideTargets[this.currentValue]
    const nextSlide = this.slideTargets[index]

    // Reset des classes pour toutes les slides
    this.slideTargets.forEach(slide => {
      slide.classList.remove('translate-x-0', '-translate-x-full', 'translate-x-full')
      slide.classList.add('translate-x-full')
    })

    // Configurer la slide actuelle et la suivante
    currentSlide.classList.remove('translate-x-full')
    currentSlide.classList.add('-translate-x-full')
    
    nextSlide.classList.remove('translate-x-full', '-translate-x-full')
    nextSlide.classList.add('translate-x-0')
    
    // Mettre à jour les indicateurs
    this.indicatorTargets.forEach((indicator, i) => {
      indicator.classList.toggle('bg-white', i === index)
      indicator.classList.toggle('bg-white/50', i !== index)
    })
    
    this.currentValue = index
  }

  startAutoPlay() {
    this.interval = setInterval(() => {
      this.next()
    }, this.intervalValue)
  }

  stopAutoPlay() {
    if (this.interval) clearInterval(this.interval)
  }

  mouseEnter() {
    this.stopAutoPlay()
  }

  mouseLeave() {
    this.startAutoPlay()
  }
} 