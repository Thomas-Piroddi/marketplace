class Product < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :condition
    belongs_to :genre
    has_one_attached :picture
  
    #   Scope methods for @products search & filter functionality
    #
    scope :search, ->(search) { where('name like ?', "%#{search}%") }
    scope :condition_id, ->(condition_id) { where condition_id: condition_id }
    scope :genre_id, ->(genre_id) { where genre_id: genre_id }
end