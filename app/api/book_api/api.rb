module BookAPI
  class API < Grape::API
    version 'v1', using: :path, vendor: 'me'
    include Grape::Extensions::Hashie::Mash::ParamBuilder

    formatter :json, SuccessFormatter
    format :json
    prefix :api

    before do
      error!("Format filter tanggal salah", 422) if params['start_date'].present? && params['start_date'] > params['end_date']
    end

    resources :book do
      params do
        optional :q, type: String
        optional :author, type: Integer
        optional :start_date, type: Date
        optional :end_date, type: Date
        optional :page, type: Integer, default: 1
        optional :limit, type: Integer, default: 25
      end
      get '/' do
        book = Book.filter(params)
        d = book.paginate(params)
        present d, with: Grape::Presenters::Presenter
      end

      get '/:id' do
        book = Book.find_by_id(params.id)
        present book, with: Grape::Presenters::Presenter
      end

      params do
        requires :title, type: String, desc: 'Author Name'
        requires :year, type: Integer
        requires :author_id, type: Integer
      end
      post '/' do
        book = Book.new_from_params(params)
        present book, with: Grape::Presenters::Presenter
      end
    end
  end
end
