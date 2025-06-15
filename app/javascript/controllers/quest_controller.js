import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "text"];
  static values = { id: Number };

  connect() {
    this.updateTextStyle();
  }

  toggle(event) {
    const checkbox = event.target;
    const isChecked = checkbox.checked;

    this.updateTextStyle();
    this.updateQuestStatus(isChecked);
  }

  updateTextStyle() {
    const checkbox = this.checkboxTarget;
    const textElement = this.textTarget;

    if (checkbox.checked) {
      textElement.classList.add("line-through", "text-gray-500");
      textElement.classList.remove("text-gray-900");
    } else {
      textElement.classList.remove("line-through", "text-gray-500");
      textElement.classList.add("text-gray-900");
    }
  }

  async updateQuestStatus(status) {
    try {
      const csrfToken = document.querySelector('[name="csrf-token"]')?.content;

      const response = await fetch(`/quests/${this.idValue}.json`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          "X-CSRF-Token": csrfToken,
        },
        body: JSON.stringify({
          quest: {
            status: status,
          },
        }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      console.log("Quest updated successfully");
    } catch (error) {
      console.error("Error updating quest:", error);
      // Revert the checkbox state if the update failed
      this.checkboxTarget.checked = !this.checkboxTarget.checked;
      this.updateTextStyle();
    }
  }
}
