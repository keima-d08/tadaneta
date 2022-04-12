class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'TVアニメ' },
    { id: 2, name: '映画' },
    { id: 3, name: 'OVA' },
    { id: 4, name: '漫画' },
    { id: 5, name: '小説' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
