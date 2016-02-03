require 'mappers/business_mapper'
require 'entities/business'

resource :businesses, desc: 'Businesses' do

  namespace ':yelp_id' do

    desc 'Get business by Yelp ID', entity: Business::Entity
    params do
      requires :yelp_id, type: String, desc: 'Yelp ID', documentation: { example: 'vcNAWiLM4dR7D2nwwJ7nCA' }
    end
    get do
      present BusinessMapper.get_by_yelp_id(params[:yelp_id])
    end
  end

  desc 'Create a business', entity: Business::Entity
  params do
    requires :yelp_id, type: String, desc: 'Yelp ID of this business', documentation: { example: 'vcNAWiLM4dR7D2nwwJ7nCA' }
    requires :name, type: String, desc: 'Name of this business', documentation: { example: 'Bobs Bar' }
    requires :full_address, type: String, desc: 'Full address of this business', documentation: { example: '4840 E Indian School Rd\nSte 101\nPhoenix, AZ 85018' }
    requires :city, type: String, desc: 'City of this business', documentation: { example: 'Phoenix' }
    requires :stars, type: Integer, desc: 'Average amount of stars this business got', documentation: { example: '4' }
    requires :review_count, type: Integer, desc: 'Amount of reviews this business got', documentation: { example: '12' }
    requires :categories, type: String, desc: 'Categories this business belongs to', documentation: { example: '["Bars", "Nightlife", "Lounges", "Restaurants"]' }
    requires :longitude, type: String, desc: 'Longitude of this business', documentation: { example: '-111.98375799999999' }
    requires :latitude, type: String, desc: 'Latitude of this business', documentation: { example: '33.499313000000001' }
  end
  post do
    present BusinessMapper.create(params)
  end

end

