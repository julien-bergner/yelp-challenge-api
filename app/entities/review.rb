require 'app/models/review'
require 'grape-entity'

class Review
  class Entity < Grape::Entity
    root 'reviews', 'review'
    #expose :id, documentation: { type: 'Integer', desc: 'Database ID of this record' }
    expose :yelp_id, documentation: { type: 'String', desc: 'Yelp ID of this review' }
    expose :yelp_user_id, documentation: { type: 'String', desc: 'Yelp ID of the author of this review' }
    expose :yelp_business_id, documentation: { type: 'String', desc: 'Yelp Business ID of the business this review is about' }
    expose :funny_count, documentation: { type: 'Integer', desc: 'How often the review has been voted as funny' }
    expose :useful_count, documentation: { type: 'Integer', desc: 'How often the review has been voted as useful' }
    expose :cool_count, documentation: { type: 'Integer', desc: 'How often the review has been voted as cool' }
    expose :text, documentation: { type: 'String', desc: 'Text of this review' }
    expose :stars, documentation: { type: 'Integer', desc: 'Average amount of stars this review got' }
    expose :date, documentation: { type: 'String', desc: 'Date on which this review was published' }
  end
end
