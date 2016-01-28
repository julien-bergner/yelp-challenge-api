class CreateReviews < ActiveRecord::Migration

  def change
    create_table :reviews do |t|
      t.string    "yelp_id",          limit: 255
      t.string    "yelp_user_id",     limit: 255
      t.integer   "funny_count"      
      t.integer   "useful_count"     
      t.integer   "cool_count"       
      t.text      "text"
      t.integer   "stars"            
      t.date      "date"
      t.timestamps null: false
    end
  end
end


   