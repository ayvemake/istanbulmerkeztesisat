import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator", "placeholder", "controls"]
  static values = { 
    current: { type: Number, default: 0 },
    interval: { type: Number, default: 5000 }
  }
  
  connect() {
    if (this.slideTargets.length > 0) {
      this.currentValue = 0
      this.showSlide(0)
    }
    this.startAutoRotation()
    this.handleImageLoading()
    this.touchStartX = null
    this.touchStartY = null
    this.initialX = null
    this.initialY = null
    if (this.hasIndicatorTarget) {
      this.updateIndicators()
    }
    
    // Auto-play
    this.startAutoPlay()
  }

  disconnect() {
    this.stopAutoRotation()
    this.stopAutoPlay()
  }

  next() {
    this.currentValue = (this.currentValue + 1) % this.slideTargets.length
    this.showSlide(this.currentValue)
  }

  previous() {
    this.currentValue = (this.currentValue - 1 + this.slideTargets.length) % this.slideTargets.length
    this.showSlide(this.currentValue)
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, i) => {
      if (i === index) {
        slide.classList.remove('hidden')
        slide.classList.add('block')
      } else {
        slide.classList.add('hidden')
        slide.classList.remove('block')
      }
    })
    this.updateIndicators()
  }

  updateIndicators() {
    if (this.hasIndicatorTarget) {
      this.indicatorTargets.forEach((indicator, index) => {
        indicator.classList.toggle('bg-white', index === this.currentValue)
        indicator.classList.toggle('bg-white/50', index !== this.currentValue)
      })
    }
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
    this.stopAutoPlay()
  }

  mouseLeave() {
    this.startAutoRotation()
    this.startAutoPlay()
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

  startAutoPlay() {
    this.autoPlayInterval = setInterval(() => {
      this.next()
    }, 5000)
  }

  stopAutoPlay() {
    if (this.autoPlayInterval) {
      clearInterval(this.autoPlayInterval)
    }
  }
} 