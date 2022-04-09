FactoryBot.define do
  factory :post do
    title                   { 'テスト' }
    product                 { 'テスト' }
    genre_id                { '2' }
    type_id                 { '2' }
    spoil_id                { '2' }
    content                 { 'テスト' }

    association :user

  end
end