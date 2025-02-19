class ChangeCommunityIdToNullOnPosts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :posts, :community_id, true
  end
end
