# README

# アプリケーション名

# アプリケーション概要

# URL

# テスト用アカウント

# 利用方法

# アプリケーションを作成した背景

# 洗い出した要件

# 実装した機能及びその説明

# 今後実装予定の機能（ある場合）

# データベース設計

# 画面遷移図

# 開発環境 使用した言語、サービス

# ローカルでの動作方法 git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。

## 工夫したポイント 制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。

























* usersテーブル

| Colum              | Type        | Options                            |
|--------------------|-------------|------------------------------------|
| email              | string      |  null: false, unique: true         |
| encrypted_password | string      |  null: false                       |
| nickname           | string      |  null: false                       |
| profile            | text        |  null: false                       |

### Association
- has_many :posts
- has_many :comments
- has_many :favorites
- has_many :follower, class_name: "Relationship"
- has_many :followed, class_name: "Relationship"
- has_many :following_user, through: :follower, source: :followed
- has_many :follower_user, through: :followed, source: :follower


* postsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| title              | string      |  null: false                      |
| product            | string      |  null: false                      |
| genre_id           | integer     |  null: false                      |
| type1_id           | integer     |  null: false                      |
| spoil_id           | integer     |  null: false                      |
| user               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites

* commentsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| comment            | string      |  null: false                      |
| post               | references  |  null: false, foreign_key: true   |
| user               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :post

* favoritesテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| user               | references  |  null: false, foreign_key: true   |
| post               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :post

* relationshipsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| follower           | references  |  null: false, foreign_key: true   |
| followed           | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"