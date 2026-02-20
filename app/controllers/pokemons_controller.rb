class PokemonsController < ApplicationController
  before_action :set_trainer
  def new
    @pokemon = Pokemon.new
    @pokemons = [PokeApiService.random, PokeApiService.random, PokeApiService.random]
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.trainer = @trainer
    @pokemon.save
    redirect_to trainer_path(@trainer)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:poke_id, :species, :name, :img, :poke_type, :trainer_id)
  end

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end
end
