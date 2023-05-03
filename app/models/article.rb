class Article < ApplicationRecord
  include Visible
  # from app/models/concerns/visible.rb
  
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
