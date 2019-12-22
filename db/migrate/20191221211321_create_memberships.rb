class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :zone
      t.belongs_to :club

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
