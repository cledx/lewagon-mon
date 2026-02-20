require "net/http"
require "json"

class PokeApiService
  BASE_URL = "https://pokeapi.co/api/v2/pokemon/"

  def self.fetch(id)
    url = URI("#{BASE_URL}#{id}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end

  def self.random
    poke_data = PokeApiService.fetch(rand(1..386))
    Pokemon.new(
      species: poke_data["name"].capitalize,
      name: poke_data["name"].capitalize,
      img: poke_data["sprites"]["front_default"],
      poke_type: poke_data["types"][0]["type"]["name"].capitalize,
      poke_id: poke_data["id"].to_i
    )
  end
  
end