class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy
  serialize :dialogue, coder: JSON
  TYPE = ["Bug Catcher", "Fisherman"]
  UNUSED_TYPE = ["Youngster", "School Kid", "Rich Boy", "Lady", "Camper", "Picnicker", "Hiker", "Bird Keeper", "Swimmer (Male)", "Swimmer (Female)", "Beauty", "Poké Maniac", "Guitarist", "Kindler", "Collector", "Ruin Maniac", "Psychic", "Hex Maniac", "Battle Girl", "Black Belt", "Ninja Boy", "Tuber (Male)", "Tuber (Female)", "Cooltrainer (Male)", "Cooltrainer (Female)", "Pokémon Breeder", "Pokémon Ranger", "Aroma Lady", "Pokéfan (Male)", "Pokéfan (Female)", "Reporter", "Triathlete", "Dragon Tamer", "Expert", "Parasol Lady", "Twins", "Bug Maniac", "Gentleman", "Sailor", "Boarder", "Skier", "Sr. and Jr.", "Team Aqua Grunt", "Team Magma Grunt"]
  validates :type, inclusion: { in: TYPE }
end
