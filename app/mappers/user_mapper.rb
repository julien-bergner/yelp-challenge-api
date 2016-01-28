require 'models/user'

class UserMapper

  def self.create(params)
   User.create!(params.to_h)
  end

  def self.get_by_yelp_id(yelp_id)
   User.find_by_yelp_id(yelp_id)
  end

end
