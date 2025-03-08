class ChangeNameToCommunityNameOnCommunities < ActiveRecord::Migration[7.2]
  def change
    rename_column :communities, :name, :community_name
  end
end
