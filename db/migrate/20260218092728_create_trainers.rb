class CreateTrainers < ActiveRecord::Migration[8.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :trainer_type

      t.timestamps
    end
  end
end
