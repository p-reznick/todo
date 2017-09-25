class SetDefaultCompletedSecondAttempt < ActiveRecord::Migration[5.1]
  def change
    change_column_default :todos, :completed, false
  end
end
