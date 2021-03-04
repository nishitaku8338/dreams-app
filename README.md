## アプリケーション名
dreams-app-34000

## アプリケーション概要
このアプリケーションは夢・目標をシェアしたい人をターゲットに作りました。<br>
夢・目標をまだ探している人にも有効活用できます。<br>
世の中にはどんな夢・目標を目指している人がいるのか？<br>
夢・目標を達成する為に具体的にどのような行動をしているのか？<br>
モチベーションを上げる為にどんなイメージ画像を使っているのか？<br>
投稿記事を書くことによって夢・目標の言語化とイメージを掴めることができます。<br>
また、コメント機能・いいね機能を実装しています。<br>
同じ夢・目標を持つ人の交流や、<br>
一緒に夢・目標を達成させる仲間を見つけることも可能です。

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
