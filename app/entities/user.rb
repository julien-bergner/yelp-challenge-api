require 'app/models/user'
require 'grape-entity'

class User
  class Entity < Grape::Entity
    root 'users', 'user'
    #expose :id, documentation: { type: 'Integer', desc: 'Database ID of this record' }
    expose :yelp_id, documentation: { type: 'String', desc: 'Yelp User ID' }
    expose :id_nearest_neighbour_1, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 1' }
    expose :proximity_nearest_neighbour_1, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 1' }
    expose :id_nearest_neighbour_2, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 2' }
    expose :proximity_nearest_neighbour_2, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 2' }
    expose :id_nearest_neighbour_3, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 3' }
    expose :proximity_nearest_neighbour_3, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 3' }
    expose :id_nearest_neighbour_4, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 4' }
    expose :proximity_nearest_neighbour_4, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 4' }
    expose :id_nearest_neighbour_5, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 5' }
    expose :proximity_nearest_neighbour_5, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 5' }
    expose :id_nearest_neighbour_6, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 6' }
    expose :proximity_nearest_neighbour_6, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 6' }
    expose :id_nearest_neighbour_7, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 7' }
    expose :proximity_nearest_neighbour_7, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 7' }
    expose :id_nearest_neighbour_8, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 8' }
    expose :proximity_nearest_neighbour_8, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 8' }
    expose :id_nearest_neighbour_9, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 9' }
    expose :proximity_nearest_neighbour_9, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 9' }
    expose :id_nearest_neighbour_10, documentation: { type: 'String', desc: 'Proximity of nearest neighbour 10' }
    expose :proximity_nearest_neighbour_10, documentation: { type: 'String', desc: 'Yelp ID of nearest neighbour 10' }
  end
end

