FactoryBot.define do
  factory :comment do
    content                 { 'テスト' }

    association :user
    association :post
  end
end
