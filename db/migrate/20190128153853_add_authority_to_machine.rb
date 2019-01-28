class AddAuthorityToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :authority, :string
  end
end
