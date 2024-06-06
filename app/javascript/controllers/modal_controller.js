import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["video", "empty"];

  connect() {
    this.element.classList.add("show");
    this.element.classList.add("d-block");
    this.isScrolling = false;
    this.scrollTimeout = null;
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
    const minDistance = 400;
    const container = this.element;

    if (container.scrollTop > minDistance) {
      this.emptyTarget.scrollIntoView({ behavior: "smooth" });
      if (
        container.scrollTop + container.clientHeight >=
        container.scrollHeight
      ) {
        this.element.classList.remove("show");
        this.element.classList.remove("d-block");
      }
    } else {
      this.videoTarget.scrollIntoView({ behavior: "smooth" });
    }
  }
}
