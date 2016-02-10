require 'mappers/user_mapper'
require 'entities/user'
require 'services/recommendation_service'

resource :users, desc: 'Users' do

  namespace ':yelp_id' do

    desc 'Get User by Yelp ID', entity: User::Entity
    params do
      requires :yelp_id, type: String, desc: 'Yelp ID', documentation: { example: '--0KsjlAThNWua2Pr4HStQ' }
    end
    get do
      present UserMapper.get_by_yelp_id(params[:yelp_id])
    end

    desc 'Get ten recommended businesses for the specified Yelp ID'
    params do
      requires :yelp_id, type: String, desc: 'Yelp ID', documentation: { example: '--0KsjlAThNWua2Pr4HStQ' }
    end
    get 'recommendations' do
      recommendation_service = RecommendationService.for(params[:yelp_id])
      
      if recommendation_service.present?
        present recommendation_service.list_of_recommendations
        present recommendation_service.list_of_businesses
      else
        "Yelp User ID not found."
      end
    end

  end

  desc 'Create a User', entity: User::Entity
  params do
    requires :yelp_id, type: String, desc: 'Yelp User ID', documentation: { example: '--0KsjlAThNWua2Pr4HStQ' }
    requires :id_nearest_neighbour_1, type: String, desc: 'Proximity of nearest neighbour 1', documentation: { example: 'Hbp3u5cMnBUojsdO3j9YMg' }
    requires :proximity_nearest_neighbour_1, type: String, desc: 'Yelp ID of nearest neighbour 1', documentation: { example: '0.147178' }
    requires :id_nearest_neighbour_2, type: String, desc: 'Proximity of nearest neighbour 2', documentation: { example: 'F2RTC8NS2pZ4oGiqadw65Q' }
    requires :proximity_nearest_neighbour_2, type: String, desc: 'Yelp ID of nearest neighbour 2', documentation: { example: '0.147217' }
    requires :id_nearest_neighbour_3, type: String, desc: 'Proximity of nearest neighbour 3', documentation: { example: 'DRleAIbN5JHG1YtAWPaOxw' }
    requires :proximity_nearest_neighbour_3, type: String, desc: 'Yelp ID of nearest neighbour 3', documentation: { example: '0.149534' }
    requires :id_nearest_neighbour_4, type: String, desc: 'Proximity of nearest neighbour 4', documentation: { example: 'FXk6124GTUtx7nU_UP7UmQ' }
    requires :proximity_nearest_neighbour_4, type: String, desc: 'Yelp ID of nearest neighbour 4', documentation: { example: '0.152421' }
    requires :id_nearest_neighbour_5, type: String, desc: 'Proximity of nearest neighbour 5', documentation: { example: '1b1cZqj7Ss15HDHOY-Htbw' }
    requires :proximity_nearest_neighbour_5, type: String, desc: 'Yelp ID of nearest neighbour 5', documentation: { example: '0.153366' }
    requires :id_nearest_neighbour_6, type: String, desc: 'Proximity of nearest neighbour 6', documentation: { example: 'GSTYqxMgPc7lZQX5l8riXg' }
    requires :proximity_nearest_neighbour_6, type: String, desc: 'Yelp ID of nearest neighbour 6', documentation: { example: '0.156158' }
    requires :id_nearest_neighbour_7, type: String, desc: 'Proximity of nearest neighbour 7', documentation: { example: '0EBdo56_h8d8-ODDU6fWSQ' }
    requires :proximity_nearest_neighbour_7, type: String, desc: 'Yelp ID of nearest neighbour 7', documentation: { example: '0.157068' }
    requires :id_nearest_neighbour_8, type: String, desc: 'Proximity of nearest neighbour 8', documentation: { example: 'BcQDCTo2BOKPIKutkYo5oA' }
    requires :proximity_nearest_neighbour_8, type: String, desc: 'Yelp ID of nearest neighbour 8', documentation: { example: '0.160212' }
    requires :id_nearest_neighbour_9, type: String, desc: 'Proximity of nearest neighbour 9', documentation: { example: 'DDOWXkKQIByxxiUBOXfXag' }
    requires :proximity_nearest_neighbour_9, type: String, desc: 'Yelp ID of nearest neighbour 9', documentation: { example: '0.162043' }
    requires :id_nearest_neighbour_10, type: String, desc: 'Proximity of nearest neighbour 10', documentation: { example: '2dtGwRaNf0NlZZfc_4FvzQ' }
    requires :proximity_nearest_neighbour_10, type: String, desc: 'Yelp ID of nearest neighbour 10', documentation: { example: '0.16324' }
  end
  post do
    present UserMapper.create(params)
  end

end
