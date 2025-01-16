import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator", "placeholder", "controls"]
  static values = { 
    current: { type: Number, default: 0 },
    interval: { type: Number, default: 5000 }
  }
  
  connect() {
    this.showSlide(this.currentValue)
    this.startAutoRotation()
    this.handleImageLoading()
    this.touchStartX = null
    this.touchStartY = null
    this.initialX = null
    this.initialY = null
  }

  disconnect() {
    this.stopAutoRotation()
  }

  next() {
    const nextIndex = (this.currentValue + 1) % this.slideTargets.length
    this.showSlide(nextIndex)
  }

  previous() {
    const prevIndex = (this.currentValue - 1 + this.slideTargets.length) % this.slideTargets.length
    this.showSlide(prevIndex)
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, i) => {
      slide.style.transition = 'transform 0.5s ease-out'
      if (i === index) {
        slide.style.transform = 'translateX(0)'
      } else if (i < index) {
        slide.style.transform = 'translateX(-100%)'
      } else {
        slide.style.transform = 'translateX(100%)'
      }
    })

    this.indicatorTargets.forEach((indicator, i) => {
      indicator.classList.toggle('bg-white', i === index)
      indicator.classList.toggle('bg-white/60', i !== index)
    })

    this.currentValue = index
  }

  select(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    this.showSlide(index)
    this.resetAutoRotation()
  }

  startAutoRotation() {
    this.stopAutoRotation()
    this.timer = setInterval(() => {
      this.next()
    }, this.intervalValue)
  }

  stopAutoRotation() {
    if (this.timer) {
      clearInterval(this.timer)
    }
  }

  resetAutoRotation() {
    this.stopAutoRotation()
    this.startAutoRotation()
  }

  mouseEnter() {
    this.stopAutoRotation()
  }

  mouseLeave() {
    this.startAutoRotation()
  }

  touchStart(event) {
    this.touchStartX = event.touches[0].clientX
    this.touchStartY = event.touches[0].clientY
    this.initialX = this.touchStartX
    this.initialY = this.touchStartY
    this.stopAutoRotation()
  }

  touchMove(event) {
    if (!this.touchStartX) return

    const currentX = event.touches[0].clientX
    const currentY = event.touches[0].clientY
    const diffX = this.touchStartX - currentX
    const diffY = this.touchStartY - currentY

    if (Math.abs(diffY) > Math.abs(diffX)) {
      this.touchStartX = null
      return
    }

    event.preventDefault()

    this.slideTargets.forEach((slide, i) => {
      const currentTranslate = i === this.currentValue ? 0 : 
                             i < this.currentValue ? -100 : 100
      const moveX = (diffX / this.element.offsetWidth) * 100
      slide.style.transform = `translateX(${currentTranslate - moveX}%)`
    })
  }

  touchEnd(event) {
    if (!this.touchStartX) return

    const diffX = this.touchStartX - (event.changedTouches[0].clientX)
    const threshold = this.element.offsetWidth * 0.25

    if (Math.abs(diffX) > threshold) {
      if (diffX > 0) {
        this.next()
      } else {
        this.previous()
      }
    } else {
      this.showSlide(this.currentValue)
    }

    this.touchStartX = null
    this.startAutoRotation()
  }

  handleImageLoading() {
    let loadedImages = 0
    const totalImages = this.slideTargets.length

    this.slideTargets.forEach(slide => {
      if (slide.complete) {
        loadedImages++
      } else {
        slide.addEventListener('load', () => {
          loadedImages++
          if (loadedImages === totalImages) {
            this.hidePlaceholder()
          }
        })
      }
    })

    if (loadedImages === totalImages) {
      this.hidePlaceholder()
    }
  }

  hidePlaceholder() {
    this.placeholderTarget.classList.add('opacity-0')
    setTimeout(() => {
      this.placeholderTarget.remove()
    }, 300)
  }
} 