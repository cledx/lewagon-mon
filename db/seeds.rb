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

[["Birch", "Professor", [252, 255, 258]],["Roxanne", "Gym Leader", [74, 74, 299]],["Brawly", "Gym Leader", [66, 307, 296]], ["Wattson", "Gym Leader", [100, 82, 309, 310]], ["Flannery", "Gym Leader", [322, 218, 323, 324]], ["Norman", "Gym Leader", [327, 288, 264, 289]], ["Winona", "Gym Leader", [333, 357, 279, 227, 334]], ["Tate & Liza", "Gym Leader", [344, 178, 337, 338]], ["Juan", "Gym Leader", [370, 340, 364, 342, 230]]].each do |trainer_data|
  trainer = Trainer.create!(
    name: trainer_data[0],
    trainer_type: trainer_data[1],
  ) 
  puts "Trainer: #{trainer.name}"
  puts "Type: #{trainer.trainer_type}"
  puts "v" * 35
  puts "|Pokemon:     |"
  trainer_data[2].each do |poke_num|
  poke_data = PokeApiService.fetch(poke_num)
      poke_type = []
      poke_data["types"].each do |p_type|
        poke_type << p_type["type"]["name"].capitalize
      end
      pokemon = Pokemon.create!(
        species: poke_data["name"].capitalize,
        name: poke_data["name"].capitalize,
        img: poke_data["sprites"]["front_default"],
        poke_type: poke_type.join(" "),
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



# 5.times do
#   puts "^" * 35
#   trainer = Trainer.create!(
#     name: TRAINER_NAMES.sample,
#     trainer_type: Trainer::TYPE.sample
#   )
#   puts "Trainer: #{trainer.name}"
#   puts "Type: #{trainer.trainer_type}"
#   puts "v" * 35
#   puts "|Pokemon:     |"  
#   rand(1..4).times do
#     poke_data = PokeApiService.fetch(rand(1..151))
#     pokemon = Pokemon.create!(
#       species: poke_data["name"].capitalize,
#       name: poke_data["name"].capitalize,
#       img: poke_data["sprites"]["front_default"],
#       poke_type: poke_data["types"][0]["type"]["name"].capitalize,
#       poke_id: poke_data["id"].to_i,
#       trainer_id: trainer.id
#     )
#     puts "|*************|"
#     puts "|Name: #{pokemon.name}"
#     puts "|Type: #{pokemon.poke_type}"
#     puts "|ID: #{pokemon.poke_id}"
#   end
#   puts "-" * 15
# end

puts "Done! Created #{Trainer.count} trainers."

