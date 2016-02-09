class Review < ActiveRecord::Base

	scope :from_user, ->(yelp_user_id) { where(yelp_user_id: yelp_user_id) }
	scope :with_min_four_stars, -> { where('stars > 3') }
end