FactoryBot.define do
  factory :favorite do
    post_id { FactoryBot.create(:post).id }
    user_id { FactoryBot.create(:user).id }
  end
end
