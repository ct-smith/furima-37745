class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :payer
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :payer_id
    validates :prefecture_id
    validates :condition_id
    validates :delivery_time_id
  end

  validates :price,
            numericality:
            { only_integer: true, message: 'is invalid. Input half-width characters', greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999, message: 'is out of setting range', allow_blank: true }
end
