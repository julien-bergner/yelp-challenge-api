require 'models/business'

class BusinessMapper

  def self.create(params)
   Business.create!(params.to_h)
  end

  def self.get_by_yelp_id(yelp_id)
   Business.find_by_yelp_id(yelp_id)
  end

end
