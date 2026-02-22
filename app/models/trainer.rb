class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy
  serialize :dialogue, coder: JSON
  TYPE = ["Bug Catcher", "Fisherman", "Youngster", "School Kid", "Rich Boy", "Lady",  "Hiker", "Battle Girl", "Aroma Lady"]
  ACCEPTED_TYPE = TYPE + ["Professor", "Gym Leader"]
  UNUSED_TYPE = ["Camper", "Picnicker", "Bird Keeper", "Swimmer (Male)", "Swimmer (Female)", "Beauty", "Poké Maniac", "Guitarist", "Kindler", "Collector", "Ruin Maniac", "Psychic", "Hex Maniac", "Black Belt", "Ninja Boy", "Tuber (Male)", "Tuber (Female)", "Cooltrainer (Male)", "Cooltrainer (Female)", "Pokémon Breeder", "Pokémon Ranger", "Pokéfan (Male)", "Pokéfan (Female)", "Reporter", "Triathlete", "Dragon Tamer", "Expert", "Parasol Lady", "Twins", "Bug Maniac", "Gentleman", "Sailor", "Boarder", "Skier", "Sr. and Jr.", "Team Aqua Grunt", "Team Magma Grunt"]
  validates :trainer_type, inclusion: { in: ACCEPTED_TYPE}
end
