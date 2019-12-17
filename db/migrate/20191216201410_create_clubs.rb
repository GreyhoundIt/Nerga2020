class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name, :unique => true
      t.string :postcode
      t.string :website

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :clubs, :name, unique: true
  end
end
