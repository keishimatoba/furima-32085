class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

 belongs_to :user
 has_one :order
 has_one_attached :image

 belongs_to :category
 belongs_to :condition
 belongs_to :postage_payer
 belongs_to :prefecture_code
 belongs_to :preparetion_day

    with_options presence: true do
       validates :name
       validates :introduction
       validates :price
       validates :condition_id
       validates :postage_payer_id 
       validates :prefecture_code_id 
       validates :preparetion_day_id
       validates :category_id
    end

    with_options numericality: { other_than: 1 } do
    　　validates :condition_id
    　　validates :postage_payer_id
    　　validates :prefecture_code_id
    　　validates :preparetion_day_id
    　　validates :category_id
    end
end
   



