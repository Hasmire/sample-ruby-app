class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :type
      t.text :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
