class ChangePokemonTypeInPokemons < ActiveRecord::Migration[8.0]
  def change
    change_column :pokemons, :pokemon_type, :integer, default: 0, null: false
  end
end
