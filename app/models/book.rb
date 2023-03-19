class Book < ApplicationRecord
  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where(':name LIKE ?', "#{theme}") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_eqal_to: 0 }

  # validate do |book|
  #   if book.name.include?('porn')
  #     book.errors[:name] << 'Porn is bad.'
  #   end
  # end
end
