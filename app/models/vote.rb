class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :vote_type, inclusion: { in: [ -1, 1 ] }  # Ensures only -1 or 1
end
