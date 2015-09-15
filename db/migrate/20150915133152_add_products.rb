class AddProducts < ActiveRecord::Migration
  def change
  	Product.create :title => 'Papperoni', :description => 'This is super pizza', :price => 79.00, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer =>false, :path_to_image => '/images/papperoni.jpg'

  	Product.create :title => '4Cheese', :description => 'The most delicious pizza', :price => 81.00, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => '/images/4cheese.jpg'

  	Product.create :title => 'Margarita', :description => 'Pizza margarita', :price => 79.00, :size => 83, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => '/images/margarita.jpg'

  end
end
