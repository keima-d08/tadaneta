# README

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