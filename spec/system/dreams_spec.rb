require 'rails_helper'

RSpec.describe '新規夢語投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @dream_title = 'タイトル'
    @dream_body = 'テキスト内容'
    @dream = FactoryBot.create(:dream)
  end

  context '新規夢語投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿')
      # 投稿ページに移動する
      visit new_dream_path
      # フォームに情報を入力する
      fill_in '叶えたい事', with: @dream_title
      fill_in 'なぜ叶えたいのか？', with: @dream_body
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('dream[image]', image_path, make_visible: true)
      # 送信するとdreamモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Dream.count }.by(1)
      # 夢語詳細ページに遷移する
      visit dream_path(@dream)
      # 夢語詳細には先ほど投稿した内容のイメージ画像が存在することを確認する
      expect(page).to have_selector('img')
      # 夢語詳細には先ほど投稿した内容の記事が存在することを確認する
      expect(page).to have_content(@dream_title)
      expect(page).to have_content(@dream_body)
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