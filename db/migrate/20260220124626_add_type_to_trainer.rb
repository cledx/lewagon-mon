class AddTypeToTrainer < ActiveRecord::Migration[8.1]
  def change
    add_column :trainers, :type, :string
  end
end
