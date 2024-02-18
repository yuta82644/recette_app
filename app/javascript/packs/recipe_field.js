
$(document).ready(function () {

  $('.trash3').click(function () {
    $(this).closest('.ingredient_container').remove();
  });
});