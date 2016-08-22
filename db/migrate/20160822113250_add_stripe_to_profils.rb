class AddStripeToProfils < ActiveRecord::Migration
  def change
    add_column :profils, :stripe_customer_token, :string
  end
end
