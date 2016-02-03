require 'grape'
require 'json'

module API

  class App < Grape::API
    version 'v1'
    prefix :api
    format :json

    before do
      header 'Content-Type', 'application/json; charset=utf-8'
    end

    # load routes
    Dir['app/routes/**'].each do |file|
      eval IO.read(file), binding
    end

    add_swagger_documentation hide_documentation_path: true, hide_format: true, api_version: self.version

  end
end
