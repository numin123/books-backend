class Base < Grape::API
  prefix 'api'
  format :json

  helpers do
    def permitted_params
      @permitted_params ||= declared(params, include_missing: false)
    end

    def authenticate!
      error!('Unauthorized. Invalid or missing token.', 401) unless current_user
    end

    def current_user
      @current_user ||= User.find_by(id: decoded_token['user_id']) if decoded_token
    end

    def decoded_token
      @decoded_token ||= JWT.decode(token, Rails.application.secrets.jwt_secret_key, true, algorithm: 'HS256') rescue nil
    end

    def token
      @token ||= request.headers['Authorization']&.split&.last
    end
  end

  mount Books
  mount Auth
end
