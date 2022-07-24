import { Controller } from "@hotwired/stimulus"

const stripeIFrameQuery = 'iframe[src^="https://js.stripe.com"]';

export default class extends Controller {
  reload(event) {
    const stripeIFrame = document.querySelector(stripeIFrameQuery);
    const newStripeIFrame = event.detail.newBody.querySelector(stripeIFrameQuery);
    if (stripeIFrame && !newStripeIFrame) {
      event.detail.newBody.appendChild(stripeIFrame);
    }
  }
}
