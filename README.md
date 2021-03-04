## アプリケーション名
dreams-app-34000


## アプリケーション概要
このアプリケーションは夢・目標をシェアしたい人をターゲットに作りました。<br>
夢・目標をまだ探している人にも有効活用できます。


## URL
https://dreams-app-34000.herokuapp.com/


## Basic認証
ID:nishino<br>
Pass:1111


## テスト用アカウント
Email：test@gmail.com<br>
Password：abcd1234


## 利用方法
### トップページ
夢語ユーザーとしてログインする
- 新規登録をする
- マイページのユーザー情報を編集できる
- 新規夢語投稿ができる
- 投稿を編集できる
- 投稿を削除できる
- 投稿詳細画面でいいねボタンが押せる
- 投稿詳細画面で投稿に関してコメントができる

ログインしなくてもサービス内容が観覧できる
- 登録しているユーザー一覧を観覧できる
- 登録しているユーザーのマイページを観覧できる
- 投稿した夢語記事一覧を観覧できる
- 夢語記事の詳細画面を観覧できる
- 夢語記事の詳細画面でコメントを観覧できる
- 夢語記事の詳細画面でいいね数を観覧できる

## 目指した課題解決
世の中にはどんな夢・目標を目指している人がいるのか？<br>
夢・目標を達成する為に具体的にどのような行動をしているのか？<br>
モチベーションを上げる為にどんなイメージ画像を使っているのか？<br>
投稿記事を書くことによって夢・目標の言語化とイメージを掴めることができます。<br>
また、コメント機能・いいね機能を実装しています。<br>
同じ夢・目標を持つ人の交流や、<br>
一緒に夢・目標を達成させる仲間を見つけることも可能です。


## 洗い出した要件
### トップページ
- 各機能に遷移できるボタンを作成

### ユーザー管理
- ユーザーのアカウント登録
- ログイン

### マイページ
- ユーザーのアカウント情報を公開

### マイページ編集
- ユーザーのアカウント情報を編集

### ユーザ一覧
- ユーザーの一覧を表示

### 新規投稿
- 投稿する記事を作成

### 投稿編集
- 投稿した記事を編集

### 投稿詳細
- 投稿した記事を表示

### 投稿削除
- 投稿した記事を削除

### 投稿一覧
- 投稿した記事を一覧表示

### いいね機能
- 投稿した記事を評価

### コメント機能
- 投稿した記事にコメント<br>


## 実装した機能についてのGIFと説明(DEMO)
### トップページ機能
<img width="1401" alt="top2" src="https://user-images.githubusercontent.com/75607727/109912539-a1e37b00-7cef-11eb-8a21-1734ead3db6f.png">

ログインしていない状態<br>
- 新規登録/ログインページへ遷移できるボタンがある<br>
- ユーザー一覧を確認できるページへ遷移できるボタンがある<br>
- 投稿一覧を確認できるページへ遷移できるボタンがある<br><br>

<img width="1410" alt="top1" src="https://user-images.githubusercontent.com/75607727/109910053-a0638400-7cea-11eb-894d-51248ca86e68.png">

ログインしている状態<br>
- ログイン時は、ログアウトできるボタンがある<br>
- ログイン時は、マイページに遷移できるボタンがある<br>
- ログイン時は、投稿できるページに遷移できるボタンがある<br>
- ユーザー一覧を確認できるページへ遷移できるボタンがある<br>
- 投稿一覧を確認できるページへ遷移できるボタンがある<br><br>


### ユーザ管理機能


### マイページ機能


### マイページ編集機能


### ユーザー一覧機能


### 新規投稿機能


### 投稿編集機能


### 投稿詳細機能


### 投稿一覧機能


### いいね機能


### コメント機能




## 実装予定の機能
- 投稿記事の検索機能を実装
- 非同期通信でいいね機能を実装
- 非同期通信でコメント機能を実装
- メニュー表示の修正
- 年齢層別の投稿ページ機能を実装
- 年齢層別のユーザー一覧機能を実装
- 投稿記事のジャンル機能を実装
- ジャンルに対してのタグ付け機能を実装
- 新規登録SNS認証機能を実装


## 工夫したポイント
- ログインしていないユーザーは、登録者一覧・詳細、投稿記事一覧・詳細全てのページを観覧できるようにしました
- アカウント登録後に、編集ページでプロフィールとプロフィール画像を設定することができるようにしました
- いいね機能はログインしている時だけできるようにしました
- コメント機能はログインしている時だけできるようにしました
- 全ての画像に


## データベース設計
![dreams-app](https://user-images.githubusercontent.com/75607727/109905991-04824a00-7ce3-11eb-9bb7-9aba60e8b0a6.png)


## ローカルでの動作方法
### バックエンド
ruby '2.6.5'<br>
Rails 6.0.3.5

### フロントエンド
HTML<br>
SCCS<br>
Font Awesome<br>
bulma-rails

### データベース
mysql2 0.4.4

### インフラ


### Webサーバー（本番環境）


### アプリケーションサーバー（本番環境）
heroku

### ソース管理
GitHub,GitHubDesktop

### テスト
RSoec

### エディタ
VSCode

# テーブル詳細
## users テーブル

|Column               |Type     |Options                     |
|---------------------|---------|----------------------------|
|username             |string   |null: false                 |
|email                |string   |null: false, unique: true   |
|encrypted_password   |string   |null: false                 |
|profile              |text     |                            |
|profile_image_id     |string   |                            |


### Association
has_many :dreams<br>
has_many :likes<br>
has_many :comments<br>
has_one_attached :profile_image



## dreams テーブル

|Column               |Type         |Options                          |
|---------------------|-------------|---------------------------------|
|user                 |references   |null: false, foreign_key: true   |
|title                |string       |null: false                      |
|body                 |text         |null: false                      |


### Association
belongs_to :user<br>
has_many :likes, dependent: :destroy<br>
has_many :comments, dependent: :destroy<br>
has_one_attached :image



## likes デーブル

|Column               |Type         |Options                          |
|---------------------|-------------|---------------------------------|
|user                 |references   |null: false, foreign_key: true   |
|dream                |references   |null: false, foreign_key: true   |


### Association
belongs_to :user<br>
belongs_to :dream



## comments テーブル

|Column               |Type         |Options                          |
|---------------------|-------------|---------------------------------|
|user                 |references   |null: false, foreign_key: true   |
|dream                |references   |null: false, foreign_key: true   |
|text                 |text         |null: false                      |


### Association
belongs_to :user<br>
belongs_to :dream
