FactoryBot.define do
  factory :category, class: 'Heartlike::Category' do
    title { Faker::Lorem.sentence(3, false, 4) }
    description { Faker::Lorem.sentence(15, false, 4) }
  end
end
