class Book < ApplicationRecord
  enum sales_status: {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 販売中
    end_of_print: 2, # 販売終了
  }

  ##### Scope #####
  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where('name LIKE ?', "%#{theme}%") }

  ##### Relation #####
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  ##### Validation #####
  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_eqal_to: 0 }

  validate do |book|
    if book.name.include?('porn')
      book.errors[:name] << 'Porn is bad.'
    end
  end

  ##### Callback #####
  before_validation :add_perfect_to_human
  # Bookの削除時、属性をログに表示する
  after_destroy { Rails.logger.info "Book is deleted: #{self.attributes}" }
  # コールバックに条件の設定ができる
  after_destroy :display_high_price_warning, if: :high_price?

  # タイトルにHumanがあったらPerfect Humanに変換する
  def add_perfect_to_human
    self.name.gsub!(/Human/, 'Perfect Human')
  end

  def high_price?
    price >= 5000
  end

  # 高価な書籍を削除したときに警告を表示する
  def display_high_price_warning
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check!!!!!!"
  end
end
