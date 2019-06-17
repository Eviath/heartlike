FactoryBot.define do
  factory :user, class: 'Heartlike::User' do
    email { Faker::Internet.email }
    password { 'foobar' }
  end
end
