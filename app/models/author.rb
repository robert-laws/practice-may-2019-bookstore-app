class Author < ApplicationRecord
  # Relations
  has_one :address, inverse_of: :author
  has_many :books

  accepts_nested_attributes_for :address

  # Validations
  validate :not_identical_author, on: :create
  validates :first_name, :last_name, :birth_year,
    presence: true
    
  # Scopes
  scope :sorted, -> { order(last_name: :asc, first_name: :asc) }
  scope :match_all, ->(first_name, last_name, birth_year) { where("first_name = ? AND last_name = ? AND birth_year = ?", first_name, last_name, birth_year) }

  scope :authors_by_birth_year, ->(birth_year) { where("birth_year = ?", birth_year) }

  # Instance Methods
  def name
    "#{first_name} #{last_name}"
  end

  # Lifecycle Methods - https://guides.rubyonrails.org/active_record_callbacks.html
  # before_save
  # before_validation
  # before_create
  # etc...

  def address_attributes=(address_attributes)
    if address_attributes[:id].present?
      address = Address.find(address_attributes[:id])
      address.update_attributes(address_attributes)
    else
      address = Address.new(address_attributes)
      address.author = self
    end
  end

  private

  def not_identical_author
    if Author.match_all(first_name, last_name, birth_year).present?
      errors.add(:base, "Exact name and birth year already exists in database.")
    end
  end
end