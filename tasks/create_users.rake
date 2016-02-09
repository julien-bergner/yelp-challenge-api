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

          User.create!(
            yelp_id: File.basename(file,File.extname(file)).split("--").last,

            id_nearest_neighbour_1: recommendations[0][1],
            proximity_nearest_neighbour_1: recommendations[0][0],

            id_nearest_neighbour_2: recommendations[1][1],
            proximity_nearest_neighbour_2: recommendations[1][0],

            id_nearest_neighbour_3: recommendations[2][1],
            proximity_nearest_neighbour_3: recommendations[2][0],

            id_nearest_neighbour_4: recommendations[3][1],
            proximity_nearest_neighbour_4: recommendations[3][0],

            id_nearest_neighbour_5: recommendations[4][1],
            proximity_nearest_neighbour_5: recommendations[4][0],

            id_nearest_neighbour_6: recommendations[5][1],
            proximity_nearest_neighbour_6: recommendations[5][0],

            id_nearest_neighbour_7: recommendations[6][1],
            proximity_nearest_neighbour_7: recommendations[6][0],

            id_nearest_neighbour_8: recommendations[7][1],
            proximity_nearest_neighbour_8: recommendations[7][0],

            id_nearest_neighbour_9: recommendations[8][1],
            proximity_nearest_neighbour_9: recommendations[8][0],

            id_nearest_neighbour_10: recommendations[9][1],
            proximity_nearest_neighbour_10: recommendations[9][0]
          )
        end
      end
    end
    puts "End: #{Time.now}"
  end
end

