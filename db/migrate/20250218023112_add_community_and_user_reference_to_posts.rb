class AddCommunityAndUserReferenceToPosts < ActiveRecord::Migration[7.2]
  def change
    add_reference :posts, :community, null: false, foreign_key: true
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
