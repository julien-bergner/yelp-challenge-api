class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   "yelp_id",     				    limit: 255
    	t.string   "id_nearest_neighbour_1",      	limit: 255
    	t.float    "proximity_nearest_neighbour_1"  
    	t.string   "id_nearest_neighbour_2",      	limit: 255
    	t.float    "proximity_nearest_neighbour_2"
    	t.string   "id_nearest_neighbour_3",      	limit: 255
    	t.float    "proximity_nearest_neighbour_3"
    	t.string   "id_nearest_neighbour_4",      	limit: 255
    	t.float    "proximity_nearest_neighbour_4"
    	t.string   "id_nearest_neighbour_5",      	limit: 255
    	t.float    "proximity_nearest_neighbour_5"
    	t.string   "id_nearest_neighbour_6",      	limit: 255
    	t.float    "proximity_nearest_neighbour_6"
    	t.string   "id_nearest_neighbour_7",      	limit: 255
    	t.float    "proximity_nearest_neighbour_7"
    	t.string   "id_nearest_neighbour_8",      	limit: 255
    	t.float    "proximity_nearest_neighbour_8"
    	t.string   "id_nearest_neighbour_9",      	limit: 255
    	t.float    "proximity_nearest_neighbour_9"
    	t.string   "id_nearest_neighbour_10",      	limit: 255
    	t.float    "proximity_nearest_neighbour_10"    
    end
  end
end
