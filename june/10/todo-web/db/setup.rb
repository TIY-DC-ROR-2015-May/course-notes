require 'active_record'
require 'yaml'

db_config = YAML::load(File.open('config/database.yml'))

env_config = if ENV["TEST"]
  db_config["test"]
else
  db_config["development"]
end

raise "Could not find database config for environment" unless env_config
ActiveRecord::Base.establish_connection(env_config)
