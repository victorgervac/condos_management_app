import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="select-and-go"
export default class extends Controller {
  connect() {}
  choose() {
    const selector = event.target
    selector.closest('form').submit()
  }
}