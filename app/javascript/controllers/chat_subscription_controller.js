import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static values = { chatId: Number, currentUserId: Number };
  static targets = ["messages"];

  connect() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: (data) => this.#insertMessageAndScrollDown(data) },
    );
  }

  disconnect() {
    console.log("Unsubscribed from the chat");
    this.subscription.unsubscribe();
  }

  resetForm(event) {
    event.target.reset();
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
    this.messagesTarget.scrollTo({
      left: 0,
      top: this.messagesTarget.scrollHeight,
      behavior: "smooth",
    });
  }
}
