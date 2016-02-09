require '././app/models/user'

namespace :users do

  desc "Import users with their nearest neighbours"
  task :create do
    puts "Import Users with their nearest neighbours"
    puts "Start: #{Time.now}"
    Dir["././datasets/close_neighbors_5k/*"].each do |entry|
      File.open(entry) do |file|
        while (line = file.gets)
          recommendations = YAML.load(line).sort{ |a,b| a[0] <=> b[0] }.first(10)
          filename = File.basename(file,File.extname(file))
          User.create!(
            yelp_id: filename.gsub("close_neighbors_neighbors_", ""),

            id_nearest_neighbour_1: get_value_if_present(recommendations, 0, 1),
            proximity_nearest_neighbour_1: get_value_if_present(recommendations, 0, 0),

            id_nearest_neighbour_2: get_value_if_present(recommendations, 1, 1),
            proximity_nearest_neighbour_2: get_value_if_present(recommendations, 1, 0),

            id_nearest_neighbour_3: get_value_if_present(recommendations, 2, 1),
            proximity_nearest_neighbour_3: get_value_if_present(recommendations, 2, 0),

            id_nearest_neighbour_4: get_value_if_present(recommendations, 3, 1),
            proximity_nearest_neighbour_4: get_value_if_present(recommendations, 3, 0),

            id_nearest_neighbour_5: get_value_if_present(recommendations, 4, 1),
            proximity_nearest_neighbour_5: get_value_if_present(recommendations, 4, 0),

            id_nearest_neighbour_6: get_value_if_present(recommendations, 5, 1),
            proximity_nearest_neighbour_6: get_value_if_present(recommendations, 5, 0),

            id_nearest_neighbour_7: get_value_if_present(recommendations, 6, 1),
            proximity_nearest_neighbour_7: get_value_if_present(recommendations, 6, 0),

            id_nearest_neighbour_8: get_value_if_present(recommendations, 7, 1),
            proximity_nearest_neighbour_8: get_value_if_present(recommendations, 7, 0),

            id_nearest_neighbour_9: get_value_if_present(recommendations, 8, 1),
            proximity_nearest_neighbour_9: get_value_if_present(recommendations, 8, 0),

            id_nearest_neighbour_10: get_value_if_present(recommendations, 9, 1),
            proximity_nearest_neighbour_10: get_value_if_present(recommendations, 9, 0)
          )
        end
      end
    end
    puts "End: #{Time.now}"
  end

  def get_value_if_present(data, key1, key2)
    data[key1][key2] if data[key1]
  end

end

