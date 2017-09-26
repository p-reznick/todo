class CreateUsersTableCorrect < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password, :null => false
      t.string :username, :null => false
    end
  end
end
