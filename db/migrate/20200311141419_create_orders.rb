class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :delivery_address
      t.integer :items_number
      t.float :total_order

      t.belongs_to :cart, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
