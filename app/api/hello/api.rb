module Hello
  class API < Grape::API
    version 'v1', using: :path, vendor: 'me'
    format :json
    prefix :api

    resources :test do
      get '/' do
        present :hello, "world"
      end
    end
  end
end
