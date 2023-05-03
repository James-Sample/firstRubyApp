class Comment < ApplicationRecord
  include Visible
  # from app/models/concerns/visible.rb

  belongs_to :article
end
