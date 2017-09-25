class SetCompletedFalseDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :todos, :completed, :false
  end
end
