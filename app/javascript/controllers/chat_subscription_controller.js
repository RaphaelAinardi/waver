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
      { received: (data) => this.#insertMessageAndScrollDown(data) }
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
    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    const messageElement = this.#buildMessageElement(
      currentUserIsSender,
      data.message
    );

    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement);
    this.messagesTarget.scrollTo({
      left: 0,
      top: this.messagesTarget.scrollHeight,
      behavior: "smooth",
    });
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message ${this.#justifyClass(currentUserIsSender)}">
        ${message}
      </div>
    `;
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "main-user" : "";
  }
}
