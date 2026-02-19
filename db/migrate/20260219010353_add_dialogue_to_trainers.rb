class AddDialogueToTrainers < ActiveRecord::Migration[8.1]
  def change
    add_column :trainers, :dialogue, :text
  end
end
