class CreateAdminLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_logs do |t|
      t.string :action
      t.references :trader, polymorphic: true
      t.references :admin, polymorphic: true

      t.timestamps
    end
  end
end
