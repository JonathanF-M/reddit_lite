class ReplaceForeignKeyForComments < ActiveRecord::Migration[7.2]
  def change
    remove_reference :comments, :article, index: true, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
