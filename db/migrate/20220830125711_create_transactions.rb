class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :total_price, precision: 15, scale: 10
      t.string :transaction_type
      t.integer :quantity
      t.decimal :unit_price, precision: 15, scale: 10
      t.references :user, index: true
      t.references :stock, index: true

      t.timestamps
    end
  end
end
