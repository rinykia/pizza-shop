class AddOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  	  t.text :orders_input
  	  t.text :name
  	  t.text :phone
  	  t.text :address
  	  
  	  t.timestamps null: false
  	end
  end
end
