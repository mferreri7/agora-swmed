class Note < ApplicationRecord
  validates :university, :degree, :subject, :semester, :description, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
end
