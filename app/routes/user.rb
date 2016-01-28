require 'mappers/user_mapper'
require 'entities/user'

resource :users, desc: 'Users' do

  namespace ':yelp_id' do

    desc 'Get User by Yelp ID', entity: User::Entity
    params do
      requires :yelp_id, type: String, desc: 'Yelp ID', documentation: { example: '15SdjuK7DmYqUAj6rjGowg' }
    end
    get do
      present UserMapper.get_by_yelp_id(params[:yelp_id])
    end
  end

  desc 'Create a User', entity: User::Entity
  params do
    requires :yelp_id, documentation: { type: 'String', desc: 'Yelp User ID' }
    requires :id_nearest_neighbour_1, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_1, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_2, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_2, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_3, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_3, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_4, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_4, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_5, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_5, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_6, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_6, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_7, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_7, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_8, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_8, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_9, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_9, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
    requires :id_nearest_neighbour_10, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: '-o6LK0LdVlQcE2h7pdoFuA' }
    requires :proximity_nearest_neighbour_10, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.31753719888931581' }
  end
  post do
    present UserMapper.create(params)
  end

end