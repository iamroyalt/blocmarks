class AddUserToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :user, :integer
  end
end
