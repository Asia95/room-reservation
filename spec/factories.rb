require 'date'

FactoryBot.define do
  

  sequence :name do |n|
    "#{n}"
  end

  factory :user do
    sequence(:email) { |n| "asia#{n}@test.pl" }
    password "secret"
  end

  factory :room do
    name
    capacity 20
  end

  factory :reservation do
    user
    room
    start_date { DateTime.parse("2018-10-03 10:00") }
    end_date { DateTime.parse("2018-10-03 14:00") }
  end
end