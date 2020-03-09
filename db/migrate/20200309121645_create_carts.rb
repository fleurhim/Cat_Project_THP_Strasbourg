class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

    	t.references :customer, index: true
    	t.references :JoinTableCartsItems, index: true

      t.timestamps
    end
  end
end
