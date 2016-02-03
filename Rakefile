require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

# Recursively imports all rake files
Dir.glob('./tasks/*').each do |file|
  import file
end

ActiveRecord::Base.establish_connection(
	YAML.load_file("./config/database.yml")["development"]
	)