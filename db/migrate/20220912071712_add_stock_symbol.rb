class AddStockSymbol < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :stock_symbol, :string
  end
end
