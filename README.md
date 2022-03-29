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

* postsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| title              | string      |  null: false                      |
| content            | text        |  null: false                      |
| genre_id           | integer     |  null: false                      |
| type1_id           | integer     |  null: false                      |
| type2_id           | integer     |                                   |
| spoil_id           | integer     |  null: false                      |
| image              | string      |                                   |
| user               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_many :comments

* commentsテーブル

| Colum              | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| comment            | string      |  null: false                      |
| post               | references  |  null: false, foreign_key: true   |
| user               | references  |  null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :post