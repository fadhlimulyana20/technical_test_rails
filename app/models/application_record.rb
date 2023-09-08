class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def before_values(params)
    value = {}
    params.each do |k, v|
        if v.is_a?(Hash)
            value[k] = self.before_values(v)
        else
            value[k] = eval("self.#{k.to_s}")
        end
    end
    value
  end

  def self.new_from_params(params)
    val = self.new(params)
    val.save
    val
  end

  def self.paginate(params)
    val = self.page(params.page).per(params.limit)
    {data: val, meta: {
      page: params.page,
      limt: params.limit,
      total: val.total_count
    }}
  end
end
