require 'rails_helper'

RSpec.describe RoomComment, type: :model do
  describe 'バリデーションのテスト' do
    context 'コメントの内容が空文字の場合' do
      it 'バリデーションに失敗する' do
        room_comment = FactoryBot.build(:room_comment, content: "")
        expect(room_comment).to be_invalid
      end
    end

    context 'コメントの内容が記入された場合' do
      it 'バリデーシ' do
        room_comment = FactoryBot.build(:room_comment, content: "テストコメント")
        expect(room_comment).to be_valid
      end
    end
  end
end
