import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "From JS";
  }

  updateStatus() {
    console.log('UpdateStatus');
  }
}
