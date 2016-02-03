class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :yelp_id
    add_index :reviews, :yelp_user_id
    add_index :reviews, :yelp_business_id
  end
end
