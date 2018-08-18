class Note < ApplicationRecord
  validates :university, :degree, :subject, :semester, :description, presence: true
end
