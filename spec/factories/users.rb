FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '111111a' }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    profile               {'よろしくお願いします'}

  end
end
