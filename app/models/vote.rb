class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :vote_type, inclusion: { in: [ -1, 1 ] }  # Ensures only -1 or 1

  def self.toggle_vote(votable:, user:, vote_type:)
    vote = votable.votes.find_or_initialize_by(user: user)

    if vote.new_record?
      vote.vote_type = vote_type
      vote.save!
    elsif vote.vote_type == vote_type
      vote.destroy
    else
      vote.update!(vote_type: vote_type)
    end
  end
end
