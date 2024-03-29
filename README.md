# README

# アプリケーション名
 ただのネタバレには興味ありません

# アプリケーション概要
 アニメ、漫画等の解説や考察や感想をテキスト形式で投稿し、ユーザー同士で共有しコメントのやりとりができる。
 
# URL
 http://52.192.61.26/

# テスト用アカウント
 ### Basic認証
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
 * トップページからユーザー新規登録または既存ユーザーでログインを行う。
 * ログイン後、投稿ボタンから投稿内容（タイトル、作品名、中身の種類とタイプ、ネタバレ度、本文、画像は任意）を記入して投稿する。
 * 投稿後、自分の記事を編集、削除することが可能。

 
 ### コメント
 * ログイン状態の場合は投稿詳細下部から記事にコメントすることが可能。
 * 自分のコメントは削除することが可能

 ### 投稿記事検索
 * ヘッダー内、検索フォームより投稿記事の検索を行うことができる。

 ### ユーザー管理
 * ユーザー新規登録後、ヘッダー右上部のアイコンからマイページに遷移することができる。
 * 新規登録後、マイページのユーザー情報の編集を行うことができる。

 ### いいね
 * ログイン状態の場合は他のユーザーの記事にいいねを押すことができる。
 * いいねを押した記事はユーザー詳細ページから確認することができる。

 ### ユーザーフォロー
 * ログイン状態の場合は自分以外のユーザーをフォローすることができる。
 * フォローしているユーザー、フォローされているユーザーはユーザー詳細ページから確認することができる。


# アプリケーションを作成した背景
### 解決したいと思った課題
 * アニメや漫画の感想、解説、考察等をグーグル検索等で調べた際に、数多くの個人ブログの記事が出てきてしまい、欲しい情報に辿り着くまでに複数のサイトを巡らなければならず時間がかかり、さらに情報に辿り着くまでにただのネタバレ記事や欲しくない情報を目にしてしまう。
 * 記事に対してコメントをしたいがコメントの為だけに各プラットフォーム毎にアカウントを作るのが面倒。
 * 投稿する立場で自分も情報発信の場が欲しいがプラットフォームがありすぎて何を使えばいいのかわからない、設定が面倒。
 * Twitterの140文字で表せない気持ちを気軽に投稿できる場所が欲しい。

 上記のことを自分自身感じており、知人にもヒアリングしたところあれば便利だし使うという意見を聞けたので開発を開始した。


# 洗い出した要件
 ### 要件定義シート
 * https://docs.google.com/spreadsheets/d/1MA6AArh4bH9PvMnt_MXnwoz0m_bdm_CydXmYfSHwDe8/edit#gid=982722306

# 実装した機能及びその説明
 ## ユーザー新規登録機能
  * 新規登録成功時
  [![Image from Gyazo](https://i.gyazo.com/925d77113c3f56b2d8c815b9f3d80527.gif)](https://gyazo.com/925d77113c3f56b2d8c815b9f3d80527)
  * 新規登録失敗時
  [![Image from Gyazo](https://i.gyazo.com/3c5c0b7a48ca301356d3ea0b1fbcc898.gif)](https://gyazo.com/3c5c0b7a48ca301356d3ea0b1fbcc898)

 ## ログイン、ログアウト機能
  * ログイン
   [![Image from Gyazo](https://i.gyazo.com/3fcc0f918ef9699cf4db891ee772244a.gif)](https://gyazo.com/3fcc0f918ef9699cf4db891ee772244a)
  * ログアウト
   [![Image from Gyazo](https://i.gyazo.com/fae4cd0e8b08e96487a16d97621f7f1e.gif)](https://gyazo.com/fae4cd0e8b08e96487a16d97621f7f1e)
  * ログイン失敗時
   [![Image from Gyazo](https://i.gyazo.com/aaa6de0d6fba9556aba08cc41e0ae6ad.gif)](https://gyazo.com/aaa6de0d6fba9556aba08cc41e0ae6ad)

 ## ユーザー編集機能
  * プロフィール編集
  [![Image from Gyazo](https://i.gyazo.com/f00c77ec15d47db45c95e3ea2eb6aaf3.gif)](https://gyazo.comf00c77ec15d47db45c95e3ea2eb6aaf3)
  * プロフィール画像編集
   [![Image from Gyazo](https://i.gyazo.com/06ce4898b52e4a1b8ec8b7375e80c7ae.gif)](https://gyazo.com/06ce4898b52e4a1b8ec8b7375e80c7ae)

 ## 記事投稿機能
  * 新規投稿成功時
   [![Image from Gyazo](https://i.gyazo.com/45a7c6bc96c59b1f336b81b6daead957.gif)](https://gyazo.com/45a7c6bc96c59b1f336b81b6daead957)

  * 新規投稿失敗時
   [![Image from Gyazo](https://i.gyazo.com/e6fe46690186dc7ea4a6dfb6309cb974.gif)](https://gyazo.com/e6fe46690186dc7ea4a6dfb6309cb974)
  
 ## ドラッグ＆ドロップでの画像挿入機能
   [![Image from Gyazo](https://i.gyazo.com/5b087abd3afe9179cd2330ab800e8d62.gif)](https://gyazo.com/5b087abd3afe9179cd2330ab800e8d62)

 ## 投稿記事編集機能
   [![Image from Gyazo](https://i.gyazo.com/8ec8812568d6c449c6ac72629562f08f.gif)](https://gyazo.com/8ec8812568d6c449c6ac72629562f08f)

 ## 投稿記事削除機能
   [![Image from Gyazo](https://i.gyazo.com/e0555f58ae26f51bc34d97acedc77d3c.gif)](https://gyazo.com/e0555f58ae26f51bc34d97acedc77d3c)

 ## 投稿記事検索機能
   [![Image from Gyazo](https://i.gyazo.com/354f71d0f2e24927bb5f79339af5f55b.gif)](https://gyazo.com/354f71d0f2e24927bb5f79339af5f55b)

 ## コメント機能
  * コメント投稿成功時
   [![Image from Gyazo](https://i.gyazo.com/d89dad6e0f5c3e1113d3ebc77838022c.gif)](https://gyazo.com/d89dad6e0f5c3e1113d3ebc77838022c)

  * コメント投稿失敗時
   [![Image from Gyazo](https://i.gyazo.com/1c3c1d831899c8918f5cb7cd183660bc.gif)](https://gyazo.com/1c3c1d831899c8918f5cb7cd183660bc)

  * コメント削除機能
   [![Image from Gyazo](https://i.gyazo.com/199dcb3b47dee4f4355c0539351ee2b9.gif)](https://gyazo.com/199dcb3b47dee4f4355c0539351ee2b9)
  
 ## いいね機能
   [![Image from Gyazo](https://i.gyazo.com/5ee435733952b1f393f48811f6dd4270.gif)](https://gyazo.com/5ee435733952b1f393f48811f6dd4270)

 ## ユーザーフォロー機能
   [![Image from Gyazo](https://i.gyazo.com/1369fc5905a35494675834df282964bd.gif)](https://gyazo.com/1369fc5905a35494675834df282964bd)

 ## いいね数ランキング機能
   [![Image from Gyazo](https://i.gyazo.com/5212cac7e52f1313dfb20ac5ac396a48.gif)](https://gyazo.com/5212cac7e52f1313dfb20ac5ac396a48)

# 今後実装予定の機能
 * スマートフォンからも使えるようにするためにビューのレスポンシブデザイン化
 * 検索から2つ以上のキーワードで検索できる機能
 * ユーザー管理機能の充実

# データベース設計
## ER図
 [![Image from Gyazo](https://i.gyazo.com/aaa2b7201308d5a8b74aad1bdd999a89.png)](https://gyazo.com/aaa2b7201308d5a8b74aad1bdd999a89)

## usersテーブル

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


## postsテーブル

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

## commentsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| comment            | string      |  null: false                      |
| post               | references  |  null: false, foreign_key: true   |
| user               | references  |  null: false, foreign_key: true   |

### Association
 - belongs_to :user
 - belongs_to :post

## favoritesテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| user               | references  |  null: false, foreign_key: true   |
| post               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :post

## relationshipsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| follower           | references  |  null: false, foreign_key: true   |
| followed           | references  |  null: false, foreign_key: true   |

### Association
 - belongs_to :follower, class_name: "User"
 - belongs_to :followed, class_name: "User"


# 画面遷移図
 [![Image from Gyazo](https://i.gyazo.com/f47f495419d5a538b016a4332c167265.png)](https://gyazo.com/f47f495419d5a538b016a4332c167265)

# 開発環境 使用した言語、サービス

 ## フロントサイド
  ### 使用言語
  * HTML/CSS
  * javaScript

 ## サーバーサイド
  ### フレームワーク
  * Ruby_on_rails 6.0.4.7
  ### 使用言語
  * Ruby 2.6.5
 
 ## インフラ環境
  ### サーバー
  * AWS EC2
  ### 外部ストレージ
  * AWS S3
  ### データベース
  * Mysql 14.14

 ## テスト
  ## RSpecを用いたテスト
  ### 単体テスト

  #### userモデル
  * bundle exec rspec spec/models/user_spec.rb 
  [![Image from Gyazo](https://i.gyazo.com/d934dce833820d296def7808b079621e.png)](https://gyazo.com/d934dce833820d296def7808b079621e)

  #### postモデル
  * bundle exec rspec spec/models/post_spec.rb
  [![Image from Gyazo](https://i.gyazo.com/6808619e6b4c7123b45a8adaf282da53.png)](https://gyazo.com/6808619e6b4c7123b45a8adaf282da53)

  #### commentモデル
  * bundle exec rspec spec/models/comment_spec.rb
  [![Image from Gyazo](https://i.gyazo.com/2a4779afbc9fed18decdefc94cb2b63a.png)](https://gyazo.com/2a4779afbc9fed18decdefc94cb2b63a)
 
  #### favoriteモデル
  * bundle exec rspec spec/models/favorite_spec.rb
  [![Image from Gyazo](https://i.gyazo.com/4a861998d874642b4739a4ce7bddcae8.png)](https://gyazo.com/4a861998d874642b4739a4ce7bddcae8)
 
  #### relationshipモデル
  * bundle exec rspec spec/models/relationship_spec.rb
  [![Image from Gyazo](https://i.gyazo.com/c032a48dbfe549ddeb6b4a8dc623a7b0.png)](https://gyazo.com/c032a48dbfe549ddeb6b4a8dc623a7b0)

  ## テキストエディタ
  * Visual Studio Code

# ローカルでの動作方法
 % git clone https://github.com/keima-d08/tadaneta.git<br>
 % cd tadaneta<br>
 % bundle install<br>
 % yarn install

# 工夫したポイント
 * アプリ名、アプリについての紹介文にパロディ要素を入れたり、募集中と書いてある画像をクリックしたら新規投稿ページに遷移したりと気付いたユーザー様がクスッと楽しんでもらえるであろう要素を取り入れております。
 * スクールでは学んでいない技術を多数取り入れました。<br>
 テキスト内にドラッグ＆ドロップでの画像挿入できる機能<br>
 フォローフォロワー機能<br>
 いいね機能<br>
 などの新しい技術の実装に挑戦にしていきました。
 * 本番環境はポートフォリオではありますが実用的なことを見据えEC2へのデプロイ、外部ストレージにS3を使用しております。
 
 # 開発を通して得た学び、体験、気づき。
 開発途中で別のアイディアが出て要件やデータベース設計が変わったりし、想定外の作業発生によるタイムロス。<br>
 スクールで学んでいない技術を取り入れたことにより発生したエラーの解決。<br>
 期日までに完成させるための優先順位付け、自分の今の技術力で期日までに実装が間に合うかどうかの予測、タスク管理の大変さ。<br>
 と様々な学びがあり、しんどくなかったと言えば嘘になりますが辛く感じることはありませんでした。<br>



