class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :surname
      t.string :exact_handicap
      t.string :club
      t.integer :pin, :unique => true

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :players, :pin, unique: true
  end
end
