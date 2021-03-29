class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postagetype
  belongs_to :preparationday
  belongs_to :placeshipment

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
    validates :descuription
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :postagetype_id, numericality: { other_than: 1 }
    validates :preparationday_id, numericality: { other_than: 1 }
    validates :placeshipment_id, numericality: { other_than: 1 }
  end
end
