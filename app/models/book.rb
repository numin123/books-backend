class Book < ApplicationRecord
  validates :title, presence: true
  validates :short_description, presence: true
  validates :full_description, presence: true
  validates :author, presence: true
end
