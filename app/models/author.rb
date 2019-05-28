class Author < ApplicationRecord
  has_one :address
  has_many :books
  
  validates_presence_of :first_name
  validates_presence_of :last_name

  scope :sorted, -> { order(last_name: :asc, first_name: :asc) }

  def name
    "#{first_name} #{last_name}"
  end
end
