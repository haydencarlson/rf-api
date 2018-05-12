class Forum < ApplicationRecord
  belongs_to :category
  has_many :subforums
end
