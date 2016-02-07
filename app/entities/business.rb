require 'app/models/business'
require 'grape-entity'

class Business
  class Entity < Grape::Entity
    root 'businesses', 'business'
    #expose :id, documentation: { type: 'Integer', desc: 'Database ID of this record' }
    expose :yelp_id, documentation: { type: 'String', desc: 'Yelp ID of this business' }
    expose :name, documentation: { type: 'String', desc: 'Name of this business' }
    expose :full_address, documentation: { type: 'String', desc: 'Full address of this business' }
    expose :city, documentation: { type: 'String', desc: 'City of this business' }
    expose :stars, documentation: { type: 'Integer', desc: 'Average amount of stars this business got' }
    expose :review_count, documentation: { type: 'Integer', desc: 'Amount of review this business got' }
    expose :categories, documentation: { type: 'String', desc: 'Categories this business belongs to' } do |business|
      JSON.parse(business.categories)
    end
    expose :longitude, documentation: { type: 'String', desc: 'Longitude of this business' }
    expose :latitude, documentation: { type: 'String', desc: 'Latitude of this business' }
  end
end
