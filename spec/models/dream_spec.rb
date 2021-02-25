require 'rails_helper'

RSpec.describe Dream, type: :model do
  before do
    @dream = FactoryBot.build(:dream)  # factory :dreamを参照
  end

  describe '夢語新規投稿' do
    context '新規投稿できるとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@dream).to be_valid
      end
    end

    context '夢語新規投稿ができないとき' do
      it 'image(イメージ画像)がないと登録できない' do
        @dream.image = nil
        @dream.valid?
        expect(@dream.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleがないと登録できない' do
        @dream.title = ''
        @dream.valid?
        expect(@dream.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleがないと登録できない' do
        @dream.body = ''
        @dream.valid?
        expect(@dream.errors.full_messages).to include("Body can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @dream.user = nil
        @dream.valid?
        expect(@dream.errors.full_messages).to include("User must exist")
      end
    end
  end
end

# テストコード実行コマンド
# bundle exec rspec spec/models/dream_spec.rb