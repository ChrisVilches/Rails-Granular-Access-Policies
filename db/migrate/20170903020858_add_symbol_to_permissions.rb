class AddSymbolToPermissions < ActiveRecord::Migration[5.1]
  def change
    add_column :permissions, :symbol, :string
  end
end
