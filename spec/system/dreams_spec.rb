require 'rails_helper'

RSpec.describe '新規夢語投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @dream_title = 'タイトル'
    @dream_body = 'テキスト内容'
  end
  context '新規夢語投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      # 新規投稿ページへのリンクがあることを確認する
      # 投稿ページに移動する
      # フォームに情報を入力する
      # 添付する画像を定義する
      # 画像選択フォームに画像を添付する
      # 送信するとdreamモデルのカウントが1上がることを確認する
      # 夢語詳細ページに遷移する
      # 夢語詳細には先ほど投稿した内容のイメージ画像が存在することを確認する
      # 夢語詳細には先ほど投稿した内容の記事が存在することを確認する
    end
  end
  context '新規夢語投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのリンクがない
    end
  end
end

# テストコード実行コマンド
# bundle exec rspec spec/system/dreams_spec.rb