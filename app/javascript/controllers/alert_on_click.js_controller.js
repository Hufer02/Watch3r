import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert-on-click.js"
export default class extends Controller {

  connect() {
    console.log("Hello, Stimulus!")
  }
}
