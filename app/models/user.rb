class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :confirmable, :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :votes

  # Checks if a user has voted on a given votable (Post or Comment) with a specific vote_type
  def voted_on?(votable, vote_type)
    votable.votes.exists?(user: self, vote_type: vote_type)
  end
end
