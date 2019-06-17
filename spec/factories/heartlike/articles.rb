FactoryBot.define do
  factory :article, class: 'Heartlike::Article' do
    title { Faker::Lorem.sentence(3, false, 4) }
    body { Faker::Lorem.paragraph(10) }
    association :user, factory: :user
    association :category, factory: :category
  end
end
