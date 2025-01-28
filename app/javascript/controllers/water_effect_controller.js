import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "wavesContainer"]
  static values = {
    waveCount: { type: Number, default: 3 },
    baseColor: { type: String, default: "#0A192F" }
  }

  connect() {
    this.createWaves()
    this.startAnimation()
  }

  createWaves() {
    const waves = []
    for (let i = 0; i < this.waveCountValue; i++) {
      waves.push(this.createWavePath(i))
    }
    this.wavesContainerTarget.innerHTML = waves.join('')
  }

  createWavePath(index) {
    const opacity = 0.1 + (index * 0.1)
    const animationDuration = 7 + (index * 2)
    const delay = index * 0.5
    
    // Augmentation de l'amplitude (hauteur des vagues)
    const amplitude = 80 - (index * 10) // Plus grandes vagues
    const wavelength = 400 + (index * 50) // Plus longues vagues
    
    return `
      <svg class="absolute bottom-0 left-0 w-[200%] animate-wave" 
           style="
             animation-duration: ${animationDuration}s; 
             animation-delay: -${delay}s;
             opacity: ${opacity};
             z-index: ${10 - index};
           "
           viewBox="0 0 1000 200" preserveAspectRatio="none">
        <path d="M0,100 
                 C${wavelength/4},${100-amplitude} ${wavelength/2},${100+amplitude} ${wavelength},100 
                 C${wavelength*1.25},${100-amplitude} ${wavelength*1.75},${100+amplitude} ${wavelength*2},100 
                 L${wavelength*2},200 L0,200 Z" 
              fill="${this.baseColorValue}">
          <animate attributeName="d" 
                   dur="${animationDuration}s" 
                   repeatCount="indefinite"
                   values="
                     M0,100 C${wavelength/4},${100-amplitude} ${wavelength/2},${100+amplitude} ${wavelength},100 C${wavelength*1.25},${100-amplitude} ${wavelength*1.75},${100+amplitude} ${wavelength*2},100 L${wavelength*2},200 L0,200 Z;
                     M0,100 C${wavelength/4},${100+amplitude} ${wavelength/2},${100-amplitude} ${wavelength},100 C${wavelength*1.25},${100+amplitude} ${wavelength*1.75},${100-amplitude} ${wavelength*2},100 L${wavelength*2},200 L0,200 Z;
                     M0,100 C${wavelength/4},${100-amplitude} ${wavelength/2},${100+amplitude} ${wavelength},100 C${wavelength*1.25},${100-amplitude} ${wavelength*1.75},${100+amplitude} ${wavelength*2},100 L${wavelength*2},200 L0,200 Z"
          />
        </path>
      </svg>
    `
  }

  startAnimation() {
    // Animation est gérée par SVG et CSS
  }

  disconnect() {
    // Nettoyage si nécessaire
  }
} 