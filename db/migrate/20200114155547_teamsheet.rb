class Teamsheet < ActiveRecord::Migration[6.0]
  def change
    create_table :teamsheets do |t|
      t.integer :fixture_id
      t.integer :club_id
      t.string  :player_1_first_name
      t.string  :player_1_surname
      t.string  :player_2_first_name
      t.string  :player_2_surname
      t.string  :player_3_first_name
      t.string  :player_3_surname
      t.string  :player_4_first_name
      t.string  :player_4_surname
      t.string  :player_5_first_name
      t.string  :player_5_surname
      t.string  :player_6_first_name
      t.string  :player_6_surname
      t.string  :player_7_first_name
      t.string  :player_7_surname
      t.string  :player_8_first_name
      t.string  :player_8_surname
      t.string  :guest_1_first_name
      t.string  :guest_1_surname
      t.string  :guest_2_first_name
      t.string  :guest_2_surname
      t.string  :guest_3_first_name
      t.string  :guest_3_surname

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :teamsheets ,:fixture_id
    add_index :teamsheets ,:club_id
  end
end
