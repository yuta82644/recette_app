require 'rails_helper'

RSpec.describe 'ルームでのコメント機能', type: :system do
  it "コメント投稿できる" do
    @user = FactoryBot.create(:second_user)
    visit new_user_session_path

    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit room_path(@user.rooms.first)

    fill_in 'task_title', with: 'タイトル'
    fill_in 'task_content', with: 'コンテンツ'
    fill_in 'task_start_time', with: DateTime.now.strftime('%Y-%m-%dT%H:%M:%S')

    button = find('input[type="submit"][value="create task"]')
    page.execute_script("arguments[0].click();", button)

    expect(page).to have_content('タスクを作成しました')
  end

  it "タスク投稿後、showページで削除できる" do
    @user = FactoryBot.create(:second_user)
    visit new_user_session_path

    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
    page.execute_script("arguments[0].click();", button)

    visit room_path(@user.rooms.first)

    fill_in 'task_title', with: 'タイトル'
    fill_in 'task_content', with: 'コンテンツ'
    fill_in 'task_start_time', with: DateTime.now.strftime('%Y-%m-%dT%H:%M:%S')

    button = find('input[type="submit"][value="create task"]')
    page.execute_script("arguments[0].click();", button)

    task = Task.last
    visit room_task_path(room_id: task.room_id, id: task.id)

    delete_button = find('a[data-method="delete"]')
    page.execute_script("arguments[0].click();", delete_button)
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('削除しました')
  end
end
