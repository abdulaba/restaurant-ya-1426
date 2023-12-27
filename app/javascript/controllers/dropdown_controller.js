import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {

    new SlimSelect({
      select: this.element
    })

  }
}
