class Author < ApplicationRecord
    has_many :books
    @search_filter = 'authors.name ILIKE :search'

    def self.filter(params)
        data = self.all
        data = data.where(@search_filter, search: "%#{params[:q]}%") if params[:q].present?
        data = data.between_date('created_at', params['start_date'], params['end_date']) if params['start_date'].present? && params['end_date'].present?
        data.order(created_at: :desc)
    end
end
