puts "Cleaning database..."
Trainer.destroy_all
Pokemon.destroy_all
puts "Creating trainers..."

TRAINER_NAMES = [
  "Joey",
  "Misty",
  "Brock",
  "Riley",
  "Whitney",
  "Cynthia",
  "Lance",
  "Sabrina",
  "Erika",
  "Blue"
]

TRAINER_TYPES = [
  "Bug Catcher",
  "Biker",
  "Ace Trainer",
  "Lass",
  "Hiker",
  "Youngster",
  "Poké Maniac",
  "Beauty",
  "Sailor",
  "Black Belt",
  "Psychic",
  "Ranger",
  "Fisherman",
  "Swimmer",
  "Team Grunt"
]


Trainer.create!(
  name: "Professor Oak",
  trainer_type: "Professor",
  dialogue: [
    "Hello there! Welcome to the world of Pokémon!",
    "First, tell me your name.",
    "Splendid. Now, choose your starter."
  ]
)

5.times do
  puts "^" * 35
  trainer = Trainer.create!(
    name: TRAINER_NAMES.sample,
    trainer_type: TRAINER_TYPES.sample
  )
  puts "Trainer: #{trainer.name}"
  puts "Type: #{trainer.trainer_type}"
  puts "v" * 35
  puts "|Pokemon:     |"  
  rand(1..4).times do
    poke_data = PokeApiService.fetch(rand(1..151))
    pokemon = Pokemon.create!(
      species: poke_data["name"].capitalize,
      name: poke_data["name"].capitalize,
      img: poke_data["sprites"]["front_default"],
      poke_type: poke_data["types"][0]["type"]["name"].capitalize,
      poke_id: poke_data["id"].to_i,
      trainer_id: trainer.id
    )
    puts "|*************|"
    puts "|Name: #{pokemon.name}"
    puts "|Type: #{pokemon.poke_type}"
    puts "|ID: #{pokemon.poke_id}"
  end
  puts "-" * 15
end

puts "Done! Created #{Trainer.count} trainers."

