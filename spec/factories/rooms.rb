FactoryBot.define do
  

  sequence :name do |n|
    "#{n}"
  end

  factory :room do
    name { Faker::Name.initials }
    capacity { Faker::Number.number(2) }
  end

end