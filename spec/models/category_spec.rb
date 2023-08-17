require 'rails_helper'

describe Category, type: :model do
  it '名前が空欄の場合登録できない' do
    category = Category.new(name: '')
    expect(category).not_to be_valid
  end

  it '名前が空欄でない場合登録できる' do
    category = Category.new(name: 'Test Category')
    expect(category).to be_valid
  end
end
