import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="follow"
export default class extends Controller {
  toggle(event) {
    if (
      document.querySelector(".fa-solid").classList.contains("fa-user-plus")
    ) {
      event.currentTarget.innerHTML =
        '<i class="fa-solid fa-user-minus"></i> Unfollow';
    } else {
      event.currentTarget.innerHTML =
        '<i class="fa-solid fa-user-plus"></i> Follow';
    }
  }

  quickToggle(event) {
    if (event.target.classList.contains("fa-user-plus")) {
      event.target.classList.remove("fa-user-plus");
      event.target.classList.add("fa-user-minus");
    } else {
      event.target.classList.remove("fa-user-minus");
      event.target.classList.add("fa-user-plus");
    }
  }
}
