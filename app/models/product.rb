class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories

    validates :sellprice, presence: true
    validates :buyprice, presence: true
    validates :storeepacketprice, presence: true
end