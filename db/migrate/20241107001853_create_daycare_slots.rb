class CreateDaycareSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :daycare_slots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
