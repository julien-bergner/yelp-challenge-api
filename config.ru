require File.expand_path('../config/application', __FILE__)
require 'config/initializers/active_record'
require 'app'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run API::App
