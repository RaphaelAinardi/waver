import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="follow"
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
    if (document.getElementById("icon").classList.contains("fa-user-plus")) {
      this.element.innerHTML =
        '<i class="fa-solid fa-user-minus" id="icon"></i> Unfollow';
    } else {
      this.element.innerHTML =
        '<i class="fa-solid fa-user-plus" id="icon"></i> Follow';
    }
  }

  quickToggle(event) {
    event.preventDefault();
    fetch(this.pathValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
    });
    event.currentTarget.classList.toggle("fa-user-plus");
    event.currentTarget.classList.toggle("fa-user-minus");
  }
}
