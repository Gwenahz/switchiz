class AddPhoneidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phoneid, :integer
  end
end
