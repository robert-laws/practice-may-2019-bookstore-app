class Author < ApplicationRecord
<<<<<<< HEAD
  has_many :books
=======
  validates_presence_of :first_name
  validates_presence_of :last_name
>>>>>>> 6e7522970466399334671450405fb98853a2026b

  scope :sorted, -> { order(last_name: :asc, first_name: :asc) }

  def name
    "#{first_name} #{last_name}"
  end
end
