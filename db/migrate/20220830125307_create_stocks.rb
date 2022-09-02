class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :symbol
      t.decimal :latest_price, precision: 15, scale: 10
      t.decimal :change, precision: 15, scale: 10
      t.integer :volume
      t.decimal :previous_close, precision: 15, scale: 10

      t.timestamps
    end
  end
end
