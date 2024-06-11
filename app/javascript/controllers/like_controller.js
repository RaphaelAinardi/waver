import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  static values = {
    path: String,
  };

  toggle(event) {
    event.preventDefault();
    fetch(this.pathValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
    });
    event.currentTarget.classList.toggle("fa-regular");
    event.currentTarget.classList.toggle("fa-solid");
  }
}
