class CreateTrainers < ActiveRecord::Migration[8.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
