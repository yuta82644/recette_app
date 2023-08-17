require 'rails_helper'
RSpec.describe 'ユーザー機能のテスト', type: :system do
  describe 'ユーザーのアカウント登録機能のテスト' do
    it '新規登録後、レシピ一覧画面画面に遷移する' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'test_user_01'
      fill_in 'user_email', with: 'test_user_01@exam.com'
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_on 'アカウント登録'
      expect(page).to have_content 'Open to the public'
    end
  end
  describe 'ユーザーのログイン機能のテスト' do
  before do
    @user = FactoryBot.create(:third_user) 
  end
    it 'ログインするとレシピ一覧画面画面に遷移する' do
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    button = find('input[type="submit"][value="ログイン"]')
      page.execute_script("arguments[0].click();", button)

      expect(page).to have_content 'Open to the public'
    end
  end
  sleep(3)
  context   "ログインせずmyfavorite一覧画面に飛ぼうとした場合" do
    it 'ログイン画面に遷移する​' do
      visit   favorites_path
      expect(page).to have_content 'ログイン'
    end
  end
  sleep(3)
  context   "ログインせず My recipes 一覧画面に飛ぼうとした場合" do
    it 'ログイン画面に遷移する​' do
      visit  my_recipes_recipes_path
      expect(page).to have_content 'ログイン'
    end
  end

  context "ログイン後、アカウント登録画面にアクセスしようとした場合" do
    before do
      @user = FactoryBot.create(:second_user)
      visit new_user_session_path
    end
    it "トップページにリダイレクトされる" do

      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      button = find('input[type="submit"][value="ログイン"]')
      page.execute_script("arguments[0].click();", button)
      
      expect(page).to have_content 'ログインしました'
      visit new_user_registration_path
      expect(page).to have_content 'すでにログインしています。'
    end
  end
    describe 'ログアウト機能のテスト' do
    it 'ログアウト後、トップ画面に遷移する' do
      user = FactoryBot.create(:second_user) 
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      button = find('input[type="submit"][value="ログイン"]')
      page.execute_script("arguments[0].click();", button)

      toggler_parent = find('.toggle')
      toggler_parent.click

      logout_link = find('a[data-method="delete"][href="/users/sign_out"]', visible: false)
      page.execute_script("arguments[0].click();", logout_link)

      expect(page).to have_content 'ログアウトしました。'
      expect(current_path).to eq root_path
    end
  end
end