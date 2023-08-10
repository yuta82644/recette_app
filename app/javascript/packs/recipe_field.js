
 $(document).ready(function () {
  // 削除ボタンがクリックされたときの処理
  $('.trash3').click(function () {
    // 削除対象の要素を特定して削除
    $(this).closest('.ingredient_container').remove();
  });
});