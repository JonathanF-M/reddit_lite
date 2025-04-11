class Post < ApplicationRecord
  # include Visible

  belongs_to :community
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def vote_score
    votes.sum(:vote_type)
  end
end
