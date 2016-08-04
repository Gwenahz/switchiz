class CreatePrelaunches < ActiveRecord::Migration
  def change
    create_table :prelaunches do |t|
      t.string :email
      t.text :commentaire
      t.integer :count
      t.string :code

      t.timestamps
    end
  end
end
