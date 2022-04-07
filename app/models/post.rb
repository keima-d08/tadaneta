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
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_rich_text :content

  
  scope :search, -> (search_param = nil) {
    if search_param
    return if search_param.blank?
    joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = posts.id AND action_text_rich_texts.record_type = 'Post'")
    .where("action_text_rich_texts.body LIKE ? OR posts.title LIKE ? OR product LIKE(?)", "%#{search_param}%", "%#{search_param}%", "%#{search_param}%")
   
    end
  }

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
