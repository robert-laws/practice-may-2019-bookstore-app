class Book < ApplicationRecord
  belongs_to :author
  belongs_to :book_genre
  has_many :book_shops
  has_many :shops, through: :book_shops
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

  accepts_nested_attributes_for :subjects

  scope :sorted, -> { order(title: :asc) }
  scope :books_by_genre, ->(book_genre_id) { where("book_genre_id = ?", book_genre_id) }
  scope :over_twenty_eight_dollars, -> { where("price > 28.00") }
  scope :highest_price, -> { maximum("price") }
  scope :lowest_price, -> { minimum("price") }

  def subject_ids=(ids)
    BookSubject.delete_all_by_book_id(self.id)
    ids.each do |id|
      if id.present?
        subject = Subject.find(id)
        self.subjects << subject
      end
    end
  end

  def subjects_attributes=(subject_attributes)
    subject_attributes.values.each do |subject_attribute|
      if subject_attribute.values[0].present?
        subject = Subject.find_or_create_by(subject_attribute)
        self.subjects << subject
      end
    end
  end
end
