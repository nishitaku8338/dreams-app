FactoryBot.define do
  factory :dream do
    user_id { 1 }
    title { 'MyString' }
    body { 'MyText' }
    image_id { 'MyString' }
  end
end
