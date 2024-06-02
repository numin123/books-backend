require 'bcrypt'
require 'jwt'

class Auth < Grape::API
  format :json

  resource :auth do
    desc 'Authenticate user'
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post :login do
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = JWT.encode({ user_id: user.id }, secret_key, 'HS256')
        { token: token }
      else
        error!('Invalid email or password', 401)
      end
    end

    desc 'Create a new user'
    params do
      requires :name, type: String
      requires :email, type: String
      requires :password, type: String
    end
    post :signup do
      password_digest = BCrypt::Password.create(params[:password])
      user = User.new(
        email: params[:email],
        password: password_digest,
        name: params[:name]
      )
      if user.save
        token = JWT.encode({ user_id: user.id }, secret_key, 'HS256')
        { token: token }
      else
        error!(user.errors.full_messages.join(', '), 400)
      end
    end
  end
end
