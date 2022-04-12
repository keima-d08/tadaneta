class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '解説' },
    { id: 2, name: '考察' },
    { id: 3, name: '感想' },
    { id: 4, name: 'レビュー' },
    { id: 5, name: '雑学' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
