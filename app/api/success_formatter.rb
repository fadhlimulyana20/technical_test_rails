module SuccessFormatter
  def self.call(object, env)
    response = {
      message: 'Success retrieve data',
      data: object
    }
    # response[:meta] = object[:meta] if object.try(:[], :meta).present?

    # if env["grape.request.params"]["log_incoming"].present?
    #   env["grape.request.params"]["log_incoming"].update(
    #       status_code: env['api.response.code'].present? ? env['api.response.code'] : env['api.endpoint'].status,
    #       response: response
    #   )
    # end

    response.to_json
  end
end
