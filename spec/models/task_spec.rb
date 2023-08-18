require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションに失敗する' do
        task = FactoryBot.build(:task, title: "")
        expect(task).to be_invalid
      end
    end

    context '正しい値が入力された場合' do
      it 'バリデーションに成功する' do
        task = FactoryBot.build(:task, title: "タイトル", content: "コンテンツ", start_time: Time.now)
        expect(task).to be_valid
      end
    end
  end
end
