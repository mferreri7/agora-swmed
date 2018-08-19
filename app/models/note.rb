class Note < ApplicationRecord
  validates :university, :degree, :subject, :semester, :description, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  include PgSearch
  pg_search_scope :search,
    against: [ :university, :degree, :subject, :semester, :description, :email ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
