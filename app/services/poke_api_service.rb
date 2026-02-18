require "net/http"
require "json"

class PokeApiService
  BASE_URL = "https://pokeapi.co/api/v2/pokemon/"

  def self.fetch(id)
    url = URI("#{BASE_URL}#{id}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end
  
end