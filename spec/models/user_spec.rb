require 'rails_helper'

describe 'ユーザーモデルのバリデーションテスト', type: :model do
  it '名前の入力欄が空の場合、バリデーションにひっかかる' do
    user = User.new(name: '' , email: 'test00@exam.com', password: 'test00', password_confirmation: 'test00')
    expect(user).not_to be_valid
  end
  it '全ての項目が入力されていれば、登録できる' do
    user = User.new(name: 'test00' , email: 'test@exam.com', password: 'test00', password_confirmation: 'test00')
    expect(user).to be_valid
  end
end