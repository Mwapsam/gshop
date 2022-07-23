import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "modal"];

  connect() {
    this.element.insertAdjacentHTML("beforeend", this.templateTarget.innerHTML);
  }

  show(e) {
    e.preventDefault();
    this.modalTarget.classList.remove("hidden");
  }

  hide(e) {
    e.preventDefault();
    this.modalTarget.classList.add("hidden");
    this.element.removeChild(this.element.lastElementChild);
    this.element.insertAdjacentHTML("beforeend", this.templateTarget.innerHTML);
  }
}
