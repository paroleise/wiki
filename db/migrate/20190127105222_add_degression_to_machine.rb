class AddDegressionToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :degression, :string
    add_column :machines, :details, :string
    remove_column :machines, :annotation, :string
  end
end
