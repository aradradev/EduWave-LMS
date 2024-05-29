import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  toggle() {
    const elem = document.getElementById('mobile_links')
    const barsElem = document.getElementById('bars')
    const closeElem = document.getElementById('close')
    elem.classList.toggle('hidden')
    barsElem.classList.toggle('hidden')
    closeElem.classList.toggle('hidden')
  }
}
