// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


    const btn = document.getElementById("btn");
    const cart = document.getElementById("cart");

    btn.addEventListener("mouseenter", () => {
        cart.classList.remove("hidden");
        console.log("mouseenter");
    })
    btn.addEventListener("click", () => {
        cart.classList.add("hidden");
    })