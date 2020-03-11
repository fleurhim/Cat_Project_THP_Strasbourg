class CreateJoinTableCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_cart_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :customer, index: true
      t.timestamps
    end
  end
end
