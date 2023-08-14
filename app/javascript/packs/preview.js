document.addEventListener("DOMContentLoaded", function () {
  const imageUpload = document.querySelector(".image_upload");
  const imageBox = document.querySelector("#image_preview"); // プレビュー用の div の ID を指定

  imageUpload.addEventListener("change", function (event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function () {
        imageBox.style.backgroundImage = `url('${reader.result}')`;
      };
      reader.readAsDataURL(file);
    } else {
      imageBox.style.backgroundImage = "none";
    }
  });
});
