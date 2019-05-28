class Book < ApplicationRecord
  belongs_to :author
  belongs_to :book_genre
  has_many :book_shops
  has_many :shops, through: :book_shops
end
