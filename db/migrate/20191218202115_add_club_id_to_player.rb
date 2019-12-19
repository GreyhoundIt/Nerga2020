class AddClubIdToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :club_id, :integer
    add_index :players, :club_id
  end
end
