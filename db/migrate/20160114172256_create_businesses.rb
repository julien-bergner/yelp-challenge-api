class CreateBusinesses < ActiveRecord::Migration

  def change
    create_table :businesses do |t|
      t.string   "yelp_id",           limit: 255
      t.string   "name",              limit: 255
      t.string   "full_address",      limit: 255
      t.string   "city",              limit: 255
      t.string   "categories",        limit: 255
      t.string  "longitude",          limit: 255    
      t.string  "latitude",           limit: 255        
      t.integer  "review_count"      
      t.integer  "stars"             
      t.timestamps null: false
    end
  end
end
