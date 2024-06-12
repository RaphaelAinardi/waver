import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="weather-infos-scroll"
export default class extends Controller {
  static targets = ["details"];

  scroll(event) {
    this.detailsTargets.forEach((detail) => {
      if (detail !== event.currentTarget) {
        detail.scrollLeft = event.currentTarget.scrollLeft;
      }
    });
  }
}
