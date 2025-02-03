import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["widget", "messageInput", "messageContainer"]

  connect() {
    this.phoneNumber = "+905555555555" // Votre numéro WhatsApp
  }

  toggle() {
    this.widgetTarget.classList.toggle("hidden")
  }

  sendMessage(event) {
    event.preventDefault()
    const message = this.messageInputTarget.value.trim()
    
    if (message) {
      // Ajouter le message à la conversation
      this.addMessage(message, 'sent')
      
      // Ouvrir WhatsApp avec le message pré-rempli
      const whatsappUrl = `https://wa.me/${this.phoneNumber}?text=${encodeURIComponent(message)}`
      window.open(whatsappUrl, '_blank')
      
      // Réinitialiser l'input
      this.messageInputTarget.value = ''
    }
  }

  addMessage(message, type) {
    const messageElement = document.createElement('div')
    messageElement.classList.add(
      'p-2', 'rounded-lg', 'm-2', 
      type === 'sent' ? 'bg-emerald-100 self-end' : 'bg-gray-100 self-start'
    )
    messageElement.textContent = message
    this.messageContainerTarget.appendChild(messageElement)
    this.messageContainerTarget.scrollTop = this.messageContainerTarget.scrollHeight
  }
} 