require 'rails_helper'

RSpec.describe "ルームモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'ルームの名前が空文字の場合' do
      it 'バリデーションに失敗する' do
        room = FactoryBot.build(:room, name: "")
        expect(room).to be_invalid
      end
    end

     context 'ルーム名が記入された場合' do
      it 'バリデーションに成功する' do
        room = FactoryBot.build(:room, name: "ルーム名")
        expect(room).to be_invalid
      end
    end
  end
end