import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static values = { chatId: Number };
  static targets = ["messages"];

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: (data) => this.#insertMessageAndScrollDown(data) }
    );

    this.#scrollDown();
  }

  disconnect() {
    console.log("Unsubscribed from the chat");
    this.subscription.unsubscribe();
  }

  resetForm(event) {
    event.target.reset();
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    this.#scrollDown();
  }

  #scrollDown() {
    console.log("ca scrolle ?");
    console.log(this.messagesTarget);

    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }
}
