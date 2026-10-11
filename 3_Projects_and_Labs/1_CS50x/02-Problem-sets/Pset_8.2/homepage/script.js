document.addEventListener("DOMContentLoaded", function () {
    const btn = document.querySelector("#alert-btn");
    const msg = document.querySelector("#msg");

    if (btn) {
        btn.addEventListener("click", function () {
            msg.textContent = "Hello from Dhaka! Thanks for visiting my site.";
        });
    }
});