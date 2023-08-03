const toggler = document.querySelector(".toggle");
const overlay = document.querySelector(".overlay");
const nav = document.querySelector(".nav");

toggler.addEventListener("click", () => {
  document.body.classList.toggle("show-nav");
});

overlay.addEventListener("click", () => {
  document.body.classList.remove("show-nav");
});

// サイドバーのメニューをクリックしたら非表示
const hrefLink = document.querySelectorAll('.linkList li a');
for (let i = 0; i < hrefLink.length; i++) {
  hrefLink[i].addEventListener("click", () => {
    document.body.classList.remove("show-nav");
  });
}
