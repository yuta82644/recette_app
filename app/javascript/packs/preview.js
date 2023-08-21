
document.removeEventListener("turbolinks:load", turbolinksLoadHandler);

const imageUpload = document.querySelector(".image_upload");
const imageBox = document.querySelector("#image_preview");

if (imageUpload) {
  imageUpload.addEventListener("change", function (event) {
    const file = event.target.files[0];
    imageBox.style.backgroundImage = file ? `url('${URL.createObjectURL(file)}')` : "none";
  });
}


document.addEventListener("turbolinks:load", turbolinksLoadHandler);


function turbolinksLoadHandler() {
}


turbolinksLoadHandler();
