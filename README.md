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

#### ログインしていない状態<br>
- 新規登録/ログインページへ遷移できるボタンがある<br>
- ユーザー一覧を確認できるページへ遷移できるボタンがある<br>
- 投稿一覧を確認できるページへ遷移できるボタンがある<br><br>

<img width="1410" alt="top1" src="https://user-images.githubusercontent.com/75607727/109910053-a0638400-7cea-11eb-894d-51248ca86e68.png">

#### ログインしている状態<br>
- ログイン時は、ログアウトできるボタンがある<br>
- ログイン時は、マイページに遷移できるボタンがある<br>
- ログイン時は、投稿できるページに遷移できるボタンがある<br>
- ユーザー一覧を確認できるページへ遷移できるボタンがある<br>
- 投稿一覧を確認できるページへ遷移できるボタンがある<br>


### ユーザ管理機能
#### 新規登録画面
<img width="1402" alt="sign_in" src="https://user-images.githubusercontent.com/75607727/109917247-57b2c780-7cf8-11eb-8171-40efabb041d1.png">

新規登録画面で必要な入力を実行するとアカウントを作成できる<br>
新規登録画面の必要な入力要素<br>
- ユーザーネーム<br>
- メールアドレス<br>
- パスワード<br>

#### ログイン画面
<img width="1402" alt="session" src="https://user-images.githubusercontent.com/75607727/109917335-7add7700-7cf8-11eb-8cc4-bbaa8a1a695d.png">

ログイン画面で必要な入力を実行すると作成したアカウントに再度ログインできる<br>
ログイン画面の必要な入力要素<br>
- メールアドレス<br>
- パスワード<br>
アカウントを作成すると各ページで操作できる機能が増える<br>


### マイページ機能
#### ユーザー詳細画面
![user_mypage1](https://user-images.githubusercontent.com/75607727/109917704-1bcc3200-7cf9-11eb-899b-23a86f83ddb8.jpg)
ユーザー本人のマイページ<br>
- ユーザーのプロフィールが見れる(デフォルトは空白)<br>
- ユーザーのプロフィール画像が見れる(デフォルトはサンプル画像)<br>
- 編集ページへ遷移できるボタンがある<br>
- 登録したメールアドレスを確認できる<br>

![user_mypage2](https://user-images.githubusercontent.com/75607727/109917742-28e92100-7cf9-11eb-82c0-a58528a59bfb.jpg)
ユーザー本人が投稿した記事<br>
- ユーザーの投稿した記事へ遷移できるボタンがある(投稿してない場合空白)<br>
- 投稿した記事の編集ページへ遷移できるボタンがある(投稿してない場合空白)<br>
- 投稿した記事を削除できるボタンがある(投稿してない場合空白)<br>


### マイページ編集機能
#### ユーザー詳細編集画面
<img width="1369" alt="user_mypage_edit" src="https://user-images.githubusercontent.com/75607727/109918982-3ef7e100-7cfb-11eb-9a32-9da6de2a02ec.png">
マイページ編集<br>
- ユーザーネームの編集ができる<br>
- メールアドレスの編集ができる<br>
- プロフィールを入力することができる<br>
- プロフィール画像を表示することができる<br>


### ユーザー一覧機能
#### アカウント登録しているユーザー全て
<img width="1388" alt="users_index" src="https://user-images.githubusercontent.com/75607727/109919566-305df980-7cfc-11eb-8609-127613140244.png">
各ユーザーの情報<br>
- ユーザーのプロフィール画像が表示される(デフォルトはサンプル画像)<br>
- ユーザーネームが表示される<br>
- 投稿した記事の数が表示される<br>
- プロフィールが画像をクリックすると表示しているユーザーのマイページに遷移する<br>
- ユーザーネームをクリックすると表示しているユーザーのマイページに遷移する<br>


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
- プロフィール画像は、設定していなくてもデフォルトでサンプル画像が表示されるようにしました
- いいね機能はログインしている時だけできるようにしました
- コメント機能はログインしている時だけできるようにしました
- 登録者一覧ページの画像をクリックすると、登録者のマイページに遷移できるようにしました
- 登録者一覧ページでは、登録者が投稿した記事の数を表示できるようにしました
- 投稿記事一覧ページの画像をクリックすると、投稿詳細ページに遷移できるようにしました
- 投稿記事一覧ページでは、投稿した記事の更新時間を日本時間に設定しました
- 投稿記事詳細ページでは、投稿したユーザーのプロフィール情報が表示されるように設定しました

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
