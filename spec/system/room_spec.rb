require 'rails_helper'

RSpec.describe 'ルーム機能', type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:third_user) { FactoryBot.create(:third_user) }

  it 'ルームを作成できる' do
    visit new_user_session_path

    fill_in 'user_email', with: second_user.email
    fill_in 'user_password', with: second_user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_room_path
    fill_in 'room_name', with: 'テストルーム'
    button = find('input[type="submit"][value="Create Room"]')
    page.execute_script("arguments[0].click();", button)

    expect(page).to have_content '新しいルームを作成しました'
  end

  context 'ルームを作成後'
  it 'ルームを削除できる' do
    visit new_user_session_path

    fill_in 'user_email', with: second_user.email
    fill_in 'user_password', with: second_user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_room_path
    fill_in 'room_name', with: 'テストルーム'
    button = find('input[type="submit"][value="Create Room"]')
    page.execute_script("arguments[0].click();", button)

    link = find('a[data-confirm="本当に削除しますか？"]', text: 'ルームを削除')
    page.execute_script("arguments[0].click();", link)

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'ルームを削除しました。'
  end

  context 'ルーム作成後に'
  it 'ルームを編集できる' do
    visit new_user_session_path

    fill_in 'user_email', with: second_user.email
    fill_in 'user_password', with: second_user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_room_path
    fill_in 'room_name', with: 'テストルーム'
    button = find('input[type="submit"][value="Create Room"]')
    page.execute_script("arguments[0].click();", button)

    fill_in 'room_name', with: '新しいルーム名'

    button = find('input[type="submit"][value="更新する"]')
    page.execute_script("arguments[0].click();", button)

    expect(page).to have_content '新しいルーム名'
  end

  context 'ルーム作成後'
  it 'ルームに名前で招待できる' do
    visit new_user_session_path

    fill_in 'user_email', with: second_user.email
    fill_in 'user_password', with: second_user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_room_path
    fill_in 'room_name', with: 'テストルーム'
    button = find('input[type="submit"][value="Create Room"]')
    page.execute_script("arguments[0].click();", button)

    fill_in 'room[invite_name]', with: 'test03'
    button = find('input[name="commit"][value="招待する"]')
    page.execute_script("arguments[0].click();", button)

    expect(page).to have_content 'test03'
  end

  context 'ルームに招待後'
  it 'ユーザーを削除できる' do
    visit new_user_session_path

    fill_in 'user_email', with: second_user.email
    fill_in 'user_password', with: second_user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit new_room_path
    fill_in 'room_name', with: 'テストルーム'
    button = find('input[type="submit"][value="Create Room"]')
    page.execute_script("arguments[0].click();", button)

    fill_in 'room[invite_name]', with: 'test03'
    button = find('input[name="commit"][value="招待する"]')
    page.execute_script("arguments[0].click();", button)

    delete_button = find('a[data-method="delete"]')
    page.execute_script("arguments[0].click();", delete_button)
    sleep(3)
  end
end
