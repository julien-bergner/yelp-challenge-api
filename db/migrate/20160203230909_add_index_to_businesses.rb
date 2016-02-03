class AddIndexToBusinesses < ActiveRecord::Migration
  def change
  	add_index :businesses, :yelp_id
    add_index :businesses, :city
  end
end
