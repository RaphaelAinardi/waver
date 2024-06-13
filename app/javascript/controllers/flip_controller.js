import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flip"
export default class extends Controller {
  static targets = ["card"];
  rotate() {
    this.cardTarget.classList.toggle("rotate");
  }
}
