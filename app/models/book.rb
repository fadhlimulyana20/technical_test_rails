class Book < ApplicationRecord
    belongs_to :author
    validates :title, presence: true
    validates :year, presence: true
    validates :author_id, presence: true

    def self.filter(params)
        data = self.all
        data = data.where(author_id: params[:author]) if params[:author].present?
        data = data.where(@search_filter, search: "%#{params[:q]}%") if params[:q].present?
        data = data.between_date('created_at', params['start_date'], params['end_date']) if params['start_date'].present? && params['end_date'].present?
        data.order(created_at: :desc)
    end
end
