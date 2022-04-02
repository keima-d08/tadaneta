class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :type
  belongs_to :spoil

  validates :title,       presence: true
  validates :content,     presence: true
  validates :product,     presence: true
  validates :genre_id,    presence: true, numericality: { other_than: 1 } 
  validates :type_id,     presence: true, numericality: { other_than: 1 } 
  validates :spoil_id,    presence: true, numericality: { other_than: 1 } 

  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?) OR content LIKE(?) OR product LIKE(?)', "%#{search}%","%#{search}%","%#{search}%")
    else
      Post.all
    end
  end
end
