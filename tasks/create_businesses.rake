require '././app/models/business'

namespace :businesses do
	task :create do
    puts "Import Businesses"
    puts "Start: #{Time.now}"
    File.open("././datasets/yelp_academic_dataset_business.json", "r") do |file|
    		while (line = file.gets)
    			json = JSON.parse(line)

    			yelp_id = json["review_id"]
    			name = json["name"]
    			full_address = json["full_address"]
    			city = json["city"]
    			categories = json["categories"]
    			longitude = json["longitude"]
    			latitude = json["latitude"]
                review_count = json["review_count"]
    			stars = json["stars"]

				Business.create!(   yelp_id: yelp_id, name: name, full_address: full_address, 
                                    city: city, categories: categories, longitude: longitude, latitude: latitude,
                                    review_count: review_count, stars: stars)
    		end
		end
    puts "End: #{Time.now}"
	end
end

