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

    get 'hallo' do
      { :hello => 'world' }.to_json
    end

  end
end
