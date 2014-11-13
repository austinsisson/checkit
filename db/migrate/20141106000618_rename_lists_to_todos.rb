class RenameListsToTodos < ActiveRecord::Migration
  def change
    rename_table :lists, :todos
  end
end
