require 'rails_helper'

RSpec.describe 'レシピ投稿機能', type: :system do
  it 'レシピを投稿できる（詳細画面にリダイレクトされる）' do
    @user = FactoryBot.create(:second_user)
    visit new_user_session_path
    category = FactoryBot.create(:category, name: "testcategory")
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_recipe_path

    fill_in 'recipe_title', with: 'テストレシピ'
    fill_in 'recipe_tortal_quantity', with: '2人分'
    fill_in 'recipe_short_comment', with: '美味しいレシピです'

    within('#cooking_ingredients') do
      fill_in 'recipe[cooking_ingredients_attributes][0][ingredient_name]', with: '材料名'
    end

    within('.procedures_container') do
      fill_in 'recipe[procedures_attributes][0][procedure_comment]', with: '手順text'
    end

    select category.name, from: "recipe_category_ids"
    click_on 'POST' # 投稿ボタンをクリック

    expect(page).to have_content 'テストレシピ'
  end


  it '削除できる' do
    @user = FactoryBot.create(:second_user)
    visit new_user_session_path
    category = FactoryBot.create(:category, name: "testcategory")
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)
    visit new_recipe_path

    fill_in 'recipe_title', with: 'テストレシピ'
    fill_in 'recipe_tortal_quantity', with: '2人分'
    fill_in 'recipe_short_comment', with: '美味しいレシピです'
    
    within('#cooking_ingredients') do
    fill_in 'recipe[cooking_ingredients_attributes][0][ingredient_name]', with: '材料名'
  end

    within('.procedures_container') do
      fill_in 'recipe[procedures_attributes][0][procedure_comment]', with: '手順text'
    end

    select category.name, from: "recipe_category_ids"
    sleep(3)
    click_on 'POST' # 投稿ボタンをクリック

    expect(page).to have_content 'テストレシピ'
    sleep(3)
    delete_button = find('a[data-method="delete"]')
    page.execute_script("arguments[0].click();", delete_button)
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'レシピを削除しました'
  end

  it '編集出来る' do
    @user = FactoryBot.create(:second_user)
    visit new_user_session_path
    category = FactoryBot.create(:category, name: "testcategory")
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_recipe_path

    fill_in 'recipe_title', with: 'テストレシピ'
    fill_in 'recipe_tortal_quantity', with: '2人分'
    fill_in 'recipe_short_comment', with: '美味しいレシピです'

    within('#cooking_ingredients') do
    fill_in 'recipe[cooking_ingredients_attributes][0][ingredient_name]', with: '材料名'
  end

  within('.procedures_container') do
    fill_in 'recipe[procedures_attributes][0][procedure_comment]', with: '手順text'
  end

  select category.name, from: "recipe_category_ids"
  sleep(3)
  click_on 'POST' # 投稿ボタンをクリック

  edit_button = find('a[href$="/edit"]')
  page.execute_script("arguments[0].click();", edit_button)

  fill_in 'recipe_title', with: '編集されたテストレシピ'
  click_on 'POST'

  expect(page).to have_content 'レシピを更新しました'
  expect(page).to have_content '編集されたテストレシピ'
end

it 'レシピを投稿できる(publicにチェックを入れると一般公開されている)' do
  @user = FactoryBot.create(:second_user)
  visit new_user_session_path
  category = FactoryBot.create(:category, name: "testcategory")
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  button = find('input[type="submit"][value="ログイン"]')
  page.execute_script("arguments[0].click();", button)

  visit new_recipe_path

  fill_in 'recipe_title', with: '一般公開レシピ'
  fill_in 'recipe_tortal_quantity', with: '2人分'
  fill_in 'recipe_short_comment', with: '美味しいレシピです'

  within('#cooking_ingredients') do
    fill_in 'recipe[cooking_ingredients_attributes][0][ingredient_name]', with: '材料名'
  end

  within('.procedures_container') do
    fill_in 'recipe[procedures_attributes][0][procedure_comment]', with: '手順text'
  end
  check 'recipe_public'

  select category.name, from: "recipe_category_ids"
  click_on 'POST' # 投稿ボタンをクリック
sleep(3)
  visit recipes_path

  expect(page).to have_content '一般公開レシピ'

end
it 'レシピを投稿できる(publicにチェックを入れずに投稿でroom公開される)' do
  @user = FactoryBot.create(:second_user)
  visit new_user_session_path
  category = FactoryBot.create(:category, name: "testcategory")

  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  button = find('input[type="submit"][value="ログイン"]')
  page.execute_script("arguments[0].click();", button)

  visit new_recipe_path

  fill_in 'recipe_title', with: 'ルーム限定公開レシピ'
  fill_in 'recipe_tortal_quantity', with: '2人分'
  fill_in 'recipe_short_comment', with: '美味しいレシピです'

  within('#cooking_ingredients') do
    fill_in 'recipe[cooking_ingredients_attributes][0][ingredient_name]', with: '材料名'
  end

  within('.procedures_container') do
    fill_in 'recipe[procedures_attributes][0][procedure_comment]', with: '手順text'
  end


  select category.name, from: "recipe_category_ids"
  click_on 'POST' # 投稿ボタンをクリック
sleep(3)

  visit room_path(@user.rooms.first)
  sleep(3)
  expect(page).to have_content 'ルーム限定公開レシピ'

end




end