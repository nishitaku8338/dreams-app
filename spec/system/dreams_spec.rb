require 'rails_helper'

RSpec.describe '新規夢語投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @dream_title = Faker::Lorem.sentence
    @dream_body = Faker::Lorem.sentence
  end

  context '新規夢語投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('夢語新規投稿')
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
      expect(current_path).to eq(dreams_path)
      # 夢語詳細には先ほど投稿した内容のイメージ画像が存在することを確認する
      expect(page).to have_selector('img')
      # 夢語詳細には先ほど投稿した内容の記事が存在することを確認する
      expect(page).to have_content(@dream_title)
    end
  end
  context '新規夢語投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('夢語新規投稿')
    end
  end
end

RSpec.describe '夢語投稿を編集', type: :system do
  before do
    @dream1 = FactoryBot.create(:dream)
    @dream2 = FactoryBot.create(:dream)
  end
  context '夢語投稿の編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した夢語の編集ができる' do
      # 夢語1を投稿したユーザーでログインする
      sign_in(@dream1.user)
      # 夢語1詳細ページに移動する
      visit dream_path(@dream1)
      # 夢語1に「編集」ページへのボタンリンクがあることを確認する
      expect(page).to have_content('編集画面へ')
      # 編集ページへ遷移する
      visit edit_dream_path(@dream1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#dream_title').value
      ).to eq(@dream1.title)
      expect(
        find('#dream_body').value
      ).to eq(@dream1.body)
      # 投稿内容を編集する
      fill_in 'dream_title', with: "#{@dream1.title}+編集したタイトル"
      fill_in 'dream_body', with: "#{@dream1.body}+編集したテキスト"
      # 編集してもDreamモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Dream.count }.by(0)
      # 夢語1詳細ページに遷移する
      expect(current_path).to eq(dream_path(@dream1))
      # 夢語詳細には先ほど投稿した内容のイメージ画像が存在することを確認する
      expect(page).to have_content("#{@dream1.title}+編集したタイトル")
      # 夢語詳細には先ほど投稿した内容の記事が存在することを確認する
      expect(page).to have_content("#{@dream1.body}+編集したテキスト")
    end
  end
  context '夢語投稿の編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した夢語の編集画面には遷移できない' do
      # 夢語1を投稿したユーザーでログインする
      sign_in(@dream1.user)
      # 夢語2の詳細ページへ移動する
      visit dream_path(@dream2)
      # 夢語2の詳細ページに「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集画面へ')
    end
    it 'ログインしていないと夢語投稿の編集画面には遷移できない' do
      # トップページに移動する
      visit root_path
      # 夢語1の詳細ページに移動する
      visit dream_path(@dream1)
      # 夢語1に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集画面へ')
      # 夢語2の詳細ページに移動する
      visit dream_path(@dream2)
      # 夢語2に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集画面へ')
    end
  end
end

RSpec.describe '夢語投稿削除', type: :system do
  before do
    @dream1 = FactoryBot.create(:dream)
    @dream2 = FactoryBot.create(:dream)
  end
  context '投稿削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した夢語の削除ができる' do
      # 夢語1を投稿したユーザーでログインする
      sign_in(@dream1.user)
      # 夢語1詳細ページに移動する
      visit dream_path(@dream1)
      # 夢語1に「削除」ボタンがあることを確認する
      expect(page).to have_content('削除する')
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect {
      find_link('削除する',  href: dream_path(@dream1)).click
      }.to change { Dream.count }.by(-1)
      # 夢語一覧ページに遷移する
      expect(current_path).to eq(dreams_path)
      # 夢語一覧ページには夢語1の内容が存在しないことを確認する（タイトル）
      expect(page).to have_no_content("#{@dream1.title}")
    end
  end
  context '投稿削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した夢語の削除ができない' do
      # 夢語1を投稿したユーザーでログインする
      sign_in(@dream1.user)
      # 夢語2詳細ページに移動する
      visit dream_path(@dream2)
      # 夢語2に「削除」ボタンが無いことを確認する
      expect(page).to have_no_content('削除する')
    end
    it 'ログインしていないと夢語の削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 夢語1詳細ページに移動する
      visit dream_path(@dream1)
      # 夢語1に「削除」ボタンが無いことを確認する
      expect(page).to have_no_content('削除する')
      # 夢語2詳細ページに移動する
      visit dream_path(@dream2)
      # 夢語2に「削除」ボタンが無いことを確認する
      expect(page).to have_no_content('削除する')
    end
  end
end

RSpec.describe '夢語投稿詳細', type: :system do
  before do
    @dream1 = FactoryBot.create(:dream)
  end
  it 'ログインしたユーザーは夢語詳細ページに遷移してコメント投稿欄が表示される' do
    # 夢語1を投稿したユーザーでログインする
    sign_in(@dream1.user)
    # 夢語1詳細ページに移動する
    visit dream_path(@dream1)
    # 詳細ページに夢語投稿の内容が含まれている
    expect(page).to have_content("#{@dream1.title}")
    expect(page).to have_content("#{@dream1.body}")
    expect(page).to have_selector('img')
    # コメント用のフォームが存在する
    expect(page).to have_content("この記事にコメントする")
  end
  it 'ログインしていない状態で夢語詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    # 詳細ページに遷移する
    # 詳細ページに夢語投稿の内容が含まれている
    # フォームが存在しないことを確認する
    # 「コメントの投稿はログインが必要です」が表示されていることを確認する
  end
end

# テストコード実行コマンド
# bundle exec rspec spec/system/dreams_spec.rb