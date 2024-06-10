import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["one", "two"];

  fire() {
    this.oneTarget.classList.toggle("disapear");
    this.twoTarget.classList.toggle("disapear");
  }
}
