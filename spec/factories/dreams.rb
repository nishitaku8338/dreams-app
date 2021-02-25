FactoryBot.define do
  factory :dream do
    title { 'タイトル' }
    body { 'テキスト内容' }

    association :user

    after(:build) do |item| # インスタンスが生成した後画像を生成
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
