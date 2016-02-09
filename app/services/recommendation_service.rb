class RecommendationService < Struct.new(:user)

  def self.for(yelp_id)
    user = User.find_by_yelp_id(yelp_id)
    return nil if user.nil?
    new(user)
  end

  def perform
    load_nearest_neighbours
    remove_nil_entries
    load_reviews_with_four_or_more_stars_from_neighbours
    calculate_scores_for_reviews
    exchange_review_for_business_and_round_score
    set_recommendations
    set_businesses
  end

  def load_nearest_neighbours
    @result = nearest_neighbours
  end

  def nearest_neighbours
    @nearest_neighbours ||= (1..10).collect {|number| [ user.send("proximity_nearest_neighbour_#{number}"), user.send("id_nearest_neighbour_#{number}") ]}
  end

  def remove_nil_entries
    @result.reject!{ |tuple| tuple.compact.empty? }
  end

  def load_reviews_with_four_or_more_stars_from_neighbours
    @result.collect! { |tuple| [ tuple[0], Review.from_user(tuple[1]).with_min_four_stars] }    
  end

  def calculate_scores_for_reviews
    @result.collect!{|tuple| tuple[1].collect{ |review| [ (1/tuple[0] * review.stars) , review ] }}.flatten!(1)
  end

  def exchange_review_for_business_and_round_score
    @result.collect!{|tuple| [ tuple[0].round(0), Business.find_by_yelp_id(tuple[1].yelp_business_id) ] }
  end

  def set_recommendations
    @recommendations = @result.collect{ |tuple| [ tuple[1].yelp_id, tuple[0] ] }.to_h
  end

  def set_businesses
    @businesses = @result.collect{ |tuple| tuple[1]}
  end

  def result 
    perform if @result.nil?
    @result ||= perform
  end

  def list_of_recommendations
    perform if @recommendations.nil?
    @recommendations 
    { recommendations: @recommendations }
  end

  def list_of_businesses
    perform if @businesses.nil?
    @businesses
  end

end
