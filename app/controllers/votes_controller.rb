class VotesController < ApplicationController
  def toggle
    @votable = params[:votable_type].constantize.find(params[:votable_id])
    Vote.toggle_vote(
      votable: @votable,
      user: current_user,
      vote_type: params[:vote_type].to_i
    )
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end
end
