const btn = document.querySelector("button.btn");
const show = document.querySelector(".dropdown-menu");

btn.addEventListener("click", function(e) {
    e.preventDefault;
    show.classList.add('open')
}
)