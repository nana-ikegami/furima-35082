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

  validates :name, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :category_id, presence: true
  validates :user, presence: true
  validates :descuription, presence: true
  validates :condition_id, presence: true
  validates :postagetype_id, presence: true
  validates :preparationday_id, presence: true
  validates :placeshipment_id, presence: true

  validates :image, presence: true
end
