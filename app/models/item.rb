class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :payer
  belongs_to :user
  has_one_attached :image
 

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, 
    numericality: 
    { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range', only_integer: true, message: 'is invalid. Input half-width characters', allow_blank: true }
    validates :category_id,
    numericality: { other_than: 1 }
    validates :payer_id,
    numericality: { other_than: 1 }
    validates :prefecture_id,
    numericality: { other_than: 1 }
    validates :condition_id,
    numericality: { other_than: 1 }
    validates :delivery_time_id,
    numericality: { other_than: 1 }
  end

  
end