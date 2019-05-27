class Author < ApplicationRecord
  has_many :books

  scope :sorted, -> { order(last_name: :asc, first_name: :asc) }

  def name
    "#{first_name} #{last_name}"
  end
end
