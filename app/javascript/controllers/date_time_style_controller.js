import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="date-time-style"
export default class extends Controller {
  connect() {

    const tz = Intl.DateTimeFormat().resolvedOptions().timeZone
    const scope = this.data.scope.outlets.controllerElement
    let fromDate = scope.dataset.data
    const format = scope.dataset.format
    fromDate = new Date(fromDate * 1000)
    let date = null
    if (format && format == 'time-only') {
      date = fromDate.toLocaleTimeString()
    } else {
      date = fromDate.toLocaleString('en-US', {
        timeZone: tz,
      })
    }
    this.data.scope.outlets.controllerElement.innerHTML = date
  }
}
