import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  static values = {
    queries: String,
  };

  static targets = ["cards"];

  all() {
    document.querySelectorAll(".selected").forEach((selected) => {
      selected.classList.remove("selected");
    });
    this.#fetch_spots("/spots");
  }

  select(event) {
    event.currentTarget.classList.toggle("selected");
    let url = `/spots?`;
    document.querySelectorAll(".selected").forEach((selected) => {
      if (selected.dataset.wave) {
        if (
          event.currentTarget.dataset.wave &&
          event.currentTarget !== selected
        ) {
          selected.classList.remove("selected");
        } else {
          url += `wave_type=${selected.dataset.wave}`;
        }
      } else if (selected.dataset.difficulty) {
        if (
          event.currentTarget.dataset.difficulty &&
          event.currentTarget !== selected
        ) {
          selected.classList.remove("selected");
        } else {
          url += `&difficulty=${selected.dataset.difficulty}`;
        }
      }
    });
    this.#fetch_spots(url);
  }

  #fetch_spots(url) {
    fetch(url, { headers: { Accept: "application/json" } })
      .then((response) => response.json())
      .then((data) => {
        this.cardsTarget.innerHTML = data.html;
      });
  }
}
