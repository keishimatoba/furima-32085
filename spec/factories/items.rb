FactoryBot.define do
  factory :item do
    name { '銀色スチーマー' }
    introduction { '1990年に買いました。未使用品デス。' }
    price { '300' }
    condition_id { 1 }
    postage_payer_id { 1 }
    prefecture_code_id { 1 }
    preparetion_day_id { 1 }
    category_id { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    
    
    
    association :user
  end
end