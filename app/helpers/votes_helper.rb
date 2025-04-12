module VotesHelper
  def votes_color(post, user)
    return "" unless user
    if user.voted_on?(post, 1)
      "bg-warning"
    elsif user.voted_on?(post, -1)
      "bg-primary"
    else
      ""
    end
  end
end
