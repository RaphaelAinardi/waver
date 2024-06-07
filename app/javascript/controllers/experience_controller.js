import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "form", "empty"];

  toggle() {
    this.modalTarget.classList.add("show");
    this.modalTarget.classList.add("d-block");
    this.formTarget.scrollIntoView({
      behavior: "smooth",
    });
  }

  handleScroll() {
    // Set isScrolling to true on scroll
    this.isScrolling = true;
  }

  handleTouchEnd() {
    // User has removed their finger from the screen
    this.checkScrollEnd();
  }

  checkScrollEnd() {
    // Clear any previous timeout
    clearTimeout(this.scrollTimeout);

    // Set a timeout to check if the scroll has stopped after a short delay
    this.scrollTimeout = setTimeout(() => {
      if (this.isScrolling) {
        this.isScrolling = false;
        this.onScrollEnd();
      }
    }, 100); // Adjust the delay as needed
  }

  onScrollEnd() {
    const minDistance = 150;
    const container = this.modalTarget;
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
