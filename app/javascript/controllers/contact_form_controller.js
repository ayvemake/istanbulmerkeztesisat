import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "submitButton", "phoneInput" ]

  connect() {
    this.formatPhoneNumber()
  }

  formatPhoneNumber() {
    this.phoneInputTarget.addEventListener('input', (e) => {
      let phoneNumber = e.target.value.replace(/\D/g, '')
      phoneNumber = phoneNumber.replace(/^0/, '')
      
      const formattedNumber = this.formatTurkishPhoneNumber(phoneNumber)
      e.target.value = formattedNumber
    })
  }

  formatTurkishPhoneNumber(phoneNumber) {
    if (phoneNumber.length === 0) return ''
    if (phoneNumber.length <= 3) return `+90 ${phoneNumber}`
    if (phoneNumber.length <= 6) return `+90 ${phoneNumber.slice(0,3)} ${phoneNumber.slice(3)}`
    if (phoneNumber.length <= 8) return `+90 ${phoneNumber.slice(0,3)} ${phoneNumber.slice(3,6)} ${phoneNumber.slice(6)}`
    return `+90 ${phoneNumber.slice(0,3)} ${phoneNumber.slice(3,6)} ${phoneNumber.slice(6,8)} ${phoneNumber.slice(8,10)}`
  }

  handleSubmit(event) {
    const [data, status] = event.detail
    if (status === 'success') {
      this.showToast('Mesajınız başarıyla gönderildi', 'success')
    } else {
      this.showToast('Bir hata oluştu. Lütfen tekrar deneyin.', 'error')
    }
  }

  showToast(message, type) {
    const toast = document.createElement('div')
    toast.classList.add(
      'fixed', 'top-4', 'right-4', 'z-50', 
      type === 'success' ? 'bg-green-500' : 'bg-red-500',
      'text-white', 'px-4', 'py-2', 'rounded', 'shadow-lg'
    )
    toast.textContent = message
    
    document.getElementById('notifications').appendChild(toast)
    
    setTimeout(() => {
      toast.remove()
    }, 3000)
  }
} 