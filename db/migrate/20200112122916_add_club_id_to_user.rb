class AddClubIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :club_id, :integer
  end
end
