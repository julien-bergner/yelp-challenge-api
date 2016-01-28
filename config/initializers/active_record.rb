require 'yaml'
require 'active_record'

dbfile = File.expand_path '../../database.yml', __FILE__
dbconfig = YAML.load File.read(dbfile)

ActiveRecord::Base.default_timezone = :local
ActiveRecord::Base.configurations = dbconfig
ActiveRecord::Base.raise_in_transactional_callbacks = true
ActiveRecord::Base.establish_connection dbconfig[API.env.to_s]
