class Book < ApplicationRecord
  belongs_to :author
  belongs_to :book_genre
  has_many :book_shops
  has_many :shops, through: :book_shops

  scope :sorted, -> { order(title: :asc) }
  scope :books_by_genre, ->(book_genre_id) { where("book_genre_id = ?", book_genre_id) }
end
