class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :completed, :boolean, default: false
    add_column :tasks, :progress, :integer, default: 0
    add_column :tasks, :incontext, :boolean, default: false

    add_index :tasks, :user_id
  end
end
