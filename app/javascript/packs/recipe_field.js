$(function () {
  $(".trash3").on("click", function () {
    $(this).closest(".ingredient_container").remove();
  });
});