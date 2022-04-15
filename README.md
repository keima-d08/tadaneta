# README

# アプリケーション名
 ただのネタバレには興味ありません

# アプリケーション概要
 
# URL
 http://52.192.61.26/

# テスト用アカウント
 ### Baasic認証
 * Basic認証パスワード : 0000
 * Basic認証ID : test
 ### テストユーザー1
 * email : 111@111
 * パスワード : 111111q
 ### テストユーザー2
 * email : 222@222
 * パスワード : 222222q
 ### テストユーザー3
 * email : 333@333
 * パスワード : 333333q
  
# 利用方法
### 記事投稿
 1 トップページからユーザー新規登録または既存ユーザーでログインを行う

 2 ログイン後投稿ボタンから投稿内容（タイトル、作品名、中身の種類とタイプ、ネタバレ度、本文、画像は任意）を記入して投稿する

 3 他のユーザーの気に入った記事にはいいねを押しておけば、後ほどいいね一覧ページから見直すことができる

 4 記事に対して意見や質問があるときは記事詳細ページ下部よりコメントをすることができる

 5 ヘッダー内の検索フォームから記事を検索することができる

### ユーザーコミュニケーション
 1 ログイン状態では、ユーザー詳細ページから他のユーザーをフォローすることができる


# アプリケーションを作成した背景
### 解決したいと思った課題
 * アニメや漫画の感想、解説、考察等をグーグル検索等で調べた際に、数多くの個人ブログの記事が出てきてしまい、欲しい情報に辿り着くまでに複数のサイトを巡らなければならず時間がかかり、さらに情報に辿り着くまでにただのネタバレ記事や欲しくない情報を目にしてしまう。
 * 記事に対してコメントをしたいがコメントの為だけに各プラットフォーム毎にアカウントを作るのが面倒。
 * 投稿する立場で自分も情報発信の場が欲しいがプラットフォームがありすぎて何を使えばいいのかわからない、設定が面倒。

 上記のことを自分自身感じており、知人にヒアリングしたところあれば便利だし見るという意見を聞けたので開発を開始した。


# 洗い出した要件

# 実装した機能及びその説明

# 今後実装予定の機能（ある場合）

# データベース設計

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


# 画面遷移図

# 開発環境 使用した言語、サービス

# ローカルでの動作方法 git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。

# 工夫したポイント 制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。

























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