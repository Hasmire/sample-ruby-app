class UpdateUsersAndPokemonsForActiveStorage < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :avatar, :string
    remove_column :pokemons, :image, :string
  end
end
