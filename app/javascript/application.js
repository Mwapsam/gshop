// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


let stripeIFrameQuery = 'iframe[src^="https://js.stripe.com"]';
document.addEventListener('turbo:before-render', function (event) {
  const stripeIFrame = document.querySelector(stripeIFrameQuery);
  const newStripeIFrame = event.detail.newBody.querySelector(stripeIFrameQuery);
  if (stripeIFrame && !newStripeIFrame){
    event.detail.newBody.appendChild(stripeIFrame)
  }
});