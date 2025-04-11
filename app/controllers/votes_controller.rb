class VotesController < ApplicationController
  def toggle
    Vote.toggle_vote(
      votable: params[:votable_type].constantize.find(params[:votable_id]),
      user: current_user,
      vote_type: params[:vote_type].to_i
    )
  end
end
