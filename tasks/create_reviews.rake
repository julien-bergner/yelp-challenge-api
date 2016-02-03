require '././app/models/review'

namespace :reviews do
	task :create do
    puts "Import reviews"
    puts "Start: #{Time.now}"
    File.open("././datasets/yelp_academic_dataset_review.json", "r") do |file|
    		while (line = file.gets)
    			json = JSON.parse(line)

    			yelp_id = json["review_id"]
    			yelp_user_id = json["user_id"]
    			yelp_business_id = json["business_id"]
    			funny_count = json["votes"]["funny"]
    			useful_count = json["votes"]["useful"]
    			cool_count = json["votes"]["cool"]
    			text = json["text"]
    			stars = json["stars"]
    			date = json["date"]

				  Review.create!(	yelp_id: yelp_id, yelp_user_id: yelp_user_id, yelp_business_id: yelp_business_id,
								funny_count: funny_count, useful_count: useful_count, cool_count: cool_count,
								text: text, stars: stars, date: date)
    		end
		end
    puts "End: #{Time.now}"
	end
end
