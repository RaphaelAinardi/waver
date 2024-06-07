import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "form", "empty"];

  connect() {
    console.log("Pouet");
  }

  toggle() {
    this.modalTarget.classList.add("show");
    this.modalTarget.classList.add("d-block");
    this.formTarget.scrollIntoView({
      behavior: "smooth",
    });
  }

  close() {
    const minDistance = 150;
    const container = this.modalTarget;
    console.log(container.scrollTop);
    if (container.scrollTop < minDistance) {
      this.emptyTarget.scrollIntoView({
        behavior: "smooth",
      });
      if (container.scrollTop === 0) {
        this.modalTarget.classList.remove("show");
        this.modalTarget.classList.remove("d-block");
      }
    } else {
      this.formTarget.scrollIntoView({
        behavior: "smooth",
      });
    }
  }
}
