class Book < ApplicationRecord
  belongs_to :author
  belongs_to :book_genre
  has_many :book_shops
  has_many :shops, through: :book_shops
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

  scope :sorted, -> { order(title: :asc) }
  scope :books_by_genre, ->(book_genre_id) { where("book_genre_id = ?", book_genre_id) }

  def subject_ids=(ids)
    BookSubject.delete_all_by_book_id(self.id)
    ids.each do |id|
      if id.present?
        subject = Subject.find(id)
        self.subjects << subject
      end
    end
  end
end
