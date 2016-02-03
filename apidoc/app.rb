require 'sinatra/base'

module API
  class Doc < Sinatra::Base
    get '/' do
      version = params[:version] || 'v1'
      erb :apidoc, locals: {
        api_url: "#{request.scheme}://#{request.host_with_port}/api/#{version}/swagger_doc"
      }
    end
  end
end
