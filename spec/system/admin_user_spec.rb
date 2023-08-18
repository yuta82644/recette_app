require 'rails_helper'

RSpec.describe '管理者ログイン機能', type: :system do
  describe '管理者ログイン' do
    before do
      @user = FactoryBot.create(:third_user) 
      visit new_user_session_path
    end

    it 'admin画面に遷移できる' do
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      button = find('input[type="submit"][value="ログイン"]')
      page.execute_script("arguments[0].click();", button)
      visit rails_admin_path
      expect(page).to have_content 'サイト管理'
    end
  end

  context 'admin:falseのユーザーがadminへのパスを入力' do
    before do
      @user = FactoryBot.create(:second_user)
      visit new_user_session_path
    end

    it 'エラーページが表示される' do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password

      button = find('input[type="submit"][value="ログイン"]')
      page.execute_script("arguments[0].click();", button)
      visit rails_admin_path
sleep(4)
      expect(page).not_to have_content '管理者ページ'
    end
  end
end
