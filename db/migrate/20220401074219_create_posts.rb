class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
    t.string   :title,       null: false
    t.text     :content,     null: false
    t.string   :product,     null: false
    t.integer  :genre_id,    null: false
    t.integer  :type_id,     null: false
    t.integer  :spoil_id,    null: false
    t.string   :image
    t.references   :user, foreign_key: true
    t.timestamps
    end
  end
end
