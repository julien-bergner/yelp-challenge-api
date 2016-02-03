require File.expand_path('../config/application', __FILE__)
require 'config/initializers/active_record'
require 'app'
require 'apidoc/app'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

map '/apidoc' do
  run API::Doc
end

run API::App
