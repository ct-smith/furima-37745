class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id, :purchase_id
  
  with_options presence: true do
    validates :postal_code,
    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)", allow_blank: true}
    validates :city
    validates :address_line
    validates :phone_number,
    format: {with: /\A\d{10,11}\z/, message: "is invalid", allow_blank: true}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する 
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, address_line: address_line, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building: building, purchase_id: purchase.id)
  end

end