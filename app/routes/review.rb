require 'mappers/review_mapper'
require 'entities/review'

resource :reviews, desc: 'Reviews' do

  namespace ':yelp_id' do

    desc 'Get Review by Yelp ID', entity: Review::Entity
    params do
      requires :yelp_id, type: String, desc: 'Yelp ID', documentation: { example: '15SdjuK7DmYqUAj6rjGowg' }
    end
    get do
      present ReviewMapper.get_by_yelp_id(params[:yelp_id])
    end
  end

  desc 'Create a review', entity: Review::Entity
  params do
    requires :yelp_id, type: String, desc: 'Yelp ID of this review', documentation: { example: '15SdjuK7DmYqUAj6rjGowg' }
    requires :yelp_user_id, type: String, desc: 'Yelp ID of the author of this review', documentation: { example: 'vcNAWiLM4dR7D2nwwJ7nCA' }
    requires :yelp_business_id, type: String, desc: 'Yelp Business ID of the business this review is about', documentation: { example: 'SKLw05kEIlZcpTD5pqma8Q' }
    requires :funny_count, type: Integer, desc: 'How often the review has been voted as funny', documentation: { example: '8' }
    requires :useful_count, type: Integer, desc: 'How often the review has been voted as useful', documentation: { example: '9' }
    requires :cool_count, type: Integer, desc: 'How often the review has been voted as cool', documentation: { example: '10' }
    requires :text, type: String, desc: 'Text of this review', documentation: { example: 'This is a amazing place.' }
    requires :stars, type: Integer, desc: 'Average amount of stars this review got', documentation: { example: '4' }
    requires :date, type: String, desc: 'Date on which this review was published', documentation: { example: '2012-02-14' }
  end
  post do
    present ReviewMapper.create(params)
  end

end

