class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validate_uniqueness_of :post_id, scope: :user_id
end
