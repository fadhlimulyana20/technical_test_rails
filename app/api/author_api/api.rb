module AuthorAPI
  class API < Grape::API
    version 'v1', using: :path, vendor: 'me'
    include Grape::Extensions::Hashie::Mash::ParamBuilder

    formatter :json, SuccessFormatter
    format :json
    prefix :api

    before do
      error!("Format filter tanggal salah", 422) if params['start_date'].present? && params['start_date'] > params['end_date']
    end

    resources :author do
      params do
        optional :q, type: String
        optional :start_date, type: Date
        optional :end_date, type: Date
        optional :page, type: Integer, default: 1
        optional :limit, type: Integer, default: 25
      end
      get '/' do
        author = Author.filter(params)
        present author, with: Grape::Presenters::Presenter
      end

      get '/:id' do
        author = Author.find_by_id(params.id)
        present author, with: Grape::Presenters::Presenter
      end

      params do
        requires :name, type: String, desc: 'Author Name'
      end
      post '/' do
        author = Author.new_from_params(params)
        present author, with: Grape::Presenters::Presenter
      end
    end
  end
end
