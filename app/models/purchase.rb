class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_code_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A(((0(\d{1}[(]?\d{4}|\d{2}[(]?\d{3}|\d{3}[(]?\d{2}|\d{4}[(]?\d{1}|[5789]0[(]?\d{4})[)]?)|\d{1,4}\?)\d{4}|0120[(]?\d{3}[)]?\d{3})\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Adress.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end