require 'models/review'

class ReviewMapper

  def self.create(params)
   Review.create!(params.to_h)
  end

  def self.get_by_yelp_id(yelp_id)
   Review.find_by_yelp_id(yelp_id)
  end

end
