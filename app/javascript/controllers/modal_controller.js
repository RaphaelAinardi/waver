import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["video", "empty"];

  connect() {
    this.element.classList.add("show");
    this.element.classList.add("d-block");
  }

  close() {
    const minDistance = 400;
    const container = this.element;
    if (container.scrollTop > minDistance) {
      this.emptyTarget.scrollIntoView({
        behavior: "smooth",
      });
      if (container.scrollTop === container.clientHeight) {
        this.element.classList.remove("show");
        this.element.classList.remove("d-block");
      }
    } else {
      this.videoTarget.scrollIntoView({
        behavior: "smooth",
      });
    }
  }
}
