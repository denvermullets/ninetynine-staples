class ApplicationController < ActionController::API
  before_action :authorized, only: :create

  def encode_token(payload)
    JWT.encode(payload, ENV.fetch('JWT_SECRET'))
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    # header: { 'Authorization': 'Bearer <token>' }
    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, ENV.fetch('JWT_SECRET'), true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    # possibly could just be decoded_token since this triggers a db action
    return unless decoded_token

    player_id = decoded_token[0]['player_id']
    Player.find(player_id)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
