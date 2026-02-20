class RemoveTypeFromTrainer < ActiveRecord::Migration[8.1]
  def change
    remove_column :trainers, :type
  end
end
