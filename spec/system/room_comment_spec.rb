require 'rails_helper'

RSpec.describe 'ルームでのコメント機能', type: :system do
  # it "コメント投稿出来る" do
  #   @user = FactoryBot.create(:second_user)
  #   visit new_user_session_path

  #   fill_in 'user_email', with: @user.email
  #   fill_in 'user_password', with: @user.password
  #   button = find('input[type="submit"][value="ログイン"]')
  #   page.execute_script("arguments[0].click();", button)

  #   visit room_path(@user.rooms.first)
  #   fill_in 'room_comment[content]', with: 'test comment'

  #   button = find('input[type="submit"][value="create comment"]')
  #   page.execute_script("arguments[0].click();", button)

  #   expect(page).to have_content('test comment')

  # end
#   it "コメント投稿後に削除できる" do
#   @user = FactoryBot.create(:second_user)
#   visit new_user_session_path

#   fill_in 'user_email', with: @user.email
#   fill_in 'user_password', with: @user.password
#   button = find('input[type="submit"][value="ログイン"]')
#   page.execute_script("arguments[0].click();", button)

#   visit room_path(@user.rooms.first)
#   fill_in 'room_comment[content]', with: 'test comment'

#   button = find('input[type="submit"][value="create comment"]')
#   page.execute_script("arguments[0].click();", button)

#   sleep(3)

#   element = find('.delete-link')
#   page.execute_script('arguments[0].click();', element)

#   page.driver.browser.switch_to.alert.accept
  
#   sleep(3)
#   expect(page).not_to have_content('test comment')
# end



it "コメント投稿後に編集できる" do
@user = FactoryBot.create(:second_user)
visit new_user_session_path

fill_in 'user_email', with: @user.email
fill_in 'user_password', with: @user.password
button = find('input[type="submit"][value="ログイン"]')
page.execute_script("arguments[0].click();", button)

visit room_path(@user.rooms.first)
fill_in 'room_comment[content]', with: 'test comment'

button = find('input[type="submit"][value="create comment"]')
page.execute_script("arguments[0].click();", button)

sleep(3)

element = find('.edit-link')
page.execute_script('arguments[0].click();', element)



sleep(3)
textarea_selector = 'textarea.edit[name="room_comment[content]"]'
textarea = find(textarea_selector)
textarea.set('編集したコメント')

sleep(4)

  button = find('input[type="submit"][value="edit"]')
  page.execute_script("arguments[0].click();", button)

  sleep(3)

  expect(page).to have_content('編集したコメント')

end

end
