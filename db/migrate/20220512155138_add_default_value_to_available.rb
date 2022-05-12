class AddDefaultValueToAvailable < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :available, :boolean, default: true
  end
end
