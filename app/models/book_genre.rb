class BookGenre < ApplicationRecord
  has_many :books

  validates :genre,
    presence: true,
    uniqueness: true

  scope :sorted, -> { order(genre: :asc) }

  def genre=(value)
    result = value.strip.downcase
    super(result)
  end

  def all_capitalize_genre
    self.genre.split(" ").map{|s| s.capitalize}.join(" ")
  end
end