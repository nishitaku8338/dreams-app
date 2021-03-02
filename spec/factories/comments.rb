FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}

    association :user
    association :dream
  end
end
