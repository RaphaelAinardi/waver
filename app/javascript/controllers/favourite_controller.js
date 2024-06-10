import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="favourite"
export default class extends Controller {
  static values = { id: String };
  connect() {}

  setFavourite(event) {
    event.preventDefault();
    fetch(
      `/spots/${event.currentTarget.dataset.favouriteIdValue}/set_favourite`,
      {
        method: "GET",
        headers: { "Content-Type": "application/json" },
      }
    )
      .then((response) => response.json())
      .then((data) => console.log(data));
    event.currentTarget.classList.toggle("fa-regular");
    event.currentTarget.classList.toggle("fa-solid");
  }
}
