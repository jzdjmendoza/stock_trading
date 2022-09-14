class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.references :user, index: true
      t.string :stock, null: false
      t.integer :shares

      t.timestamps
    end
  end
end
