class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.integer :user_id
      t.integer :smartphone_id
      t.integer :couleur_id
      t.string :prenom
      t.string :nom
      t.string :adresse
      t.string :compl_adresse
      t.integer :imei
      t.string :numtel

      t.timestamps
    end
  end
end
