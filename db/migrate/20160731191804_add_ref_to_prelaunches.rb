class AddRefToPrelaunches < ActiveRecord::Migration
  def change
    add_column :prelaunches, :ref, :string
  end
end
