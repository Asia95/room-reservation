FactoryBot.define do

  factory :user do
    sequence(:email) { |n| "a#{n}@test.pl" }
    password "secret"
  end
end