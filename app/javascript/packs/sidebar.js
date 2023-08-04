const toggler = document.querySelector(".toggle");
const overlay = document.querySelector(".overlay");
const nav = document.querySelector(".nav");

toggler.addEventListener("click", () => {
  document.body.classList.toggle("show-nav");
  toggler.classList.toggle("active"); // Add or remove the "active" class on toggle click
});

overlay.addEventListener("click", () => {
  document.body.classList.remove("show-nav");
  toggler.classList.remove("active"); // Remove the "active" class when the overlay is clicked
});

// サイドバーのメニューをクリックしたら非表示
const hrefLink = document.querySelectorAll('.nav ul li a');
for (let i = 0; i < hrefLink.length; i++) {
  hrefLink[i].addEventListener("click", () => {
    document.body.classList.remove("show-nav");
    toggler.classList.remove("active"); // Remove the "active" class when an <li> element is clicked
  });
}
