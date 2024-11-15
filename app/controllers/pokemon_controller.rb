class PokemonController < ApplicationController
  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      redirect_to index_path
    else
      render :new
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      redirect_to index_path, notice: "Pokemon updated successfully."
    else
      flash.now[:alert] = @pokemon.errors.full_messages.join(", ")
      render :edit, alert: "Failed to update pokemon."
    end
  end
end
