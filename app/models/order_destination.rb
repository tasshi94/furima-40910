class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_from_id, :city, :street, :building_name, :phone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :street
    validates :phone_number, length: { in: 10..11, too_short: 'is too short', too_long: 'is too long' },
                             format: { with: /\A\d+\z/, message: 'is invalid. Input only numbers' }
  end
  validates :shipping_from_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id:, item_id:)
    # 配送先を保存する
    # order_idには、変数orderのidと指定する
    Destination.create(post_code:, shipping_from_id:, city:, street:,
                       building_name:, phone_number:, order_id: order.id)
  end
end
