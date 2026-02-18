class CreatePokemons < ActiveRecord::Migration[8.1]
  def change
    create_table :pokemons do |t|
      t.string :img
      t.string :name
      t.string :type
      t.string :species
      t.references :trainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
