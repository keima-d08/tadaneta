class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'TVアニメ' },
    { id: 3, name: '映画、OVA' },
    { id: 4, name: '漫画' },
    { id: 5, name: '小説' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
