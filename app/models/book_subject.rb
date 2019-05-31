class BookSubject < ApplicationRecord
  belongs_to :book
  belongs_to :subject

  scope :find_entry, ->(book_id, subject_id) { where("book_id = ? AND subject_id = ?", book_id, subject_id) }
  scope :find_by_book_id, ->(book_id) { where("book_id = ?", book_id) }
  scope :delete_all_by_book_id, ->(book_id) { where("book_id = ?", book_id).delete_all }
end
