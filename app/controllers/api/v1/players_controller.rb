module Api
  module V1
    class PlayersController < ApplicationController
      before_action :authorized, only: [:auto_login]

      def create
        player = Player.create(player_params)

        if player.valid?
          Collection.create(player_id: player.id, description: 'Default Collection', name: 'Main Collection')
          Collection.create(player_id: player.id, description: 'Wantlist', name: 'Wantlist')

          render json: { player:, token: encode_token({ player_id: player.id }) }
        else
          render json: { message: 'Username is already taken' }
        end
      end

      def login
        player = Player.find_by(email: player_params[:email])

        # &. is the same as player && player.method
        if player&.authenticate(player_params[:password])
          render json: { player:, token: encode_token({ player_id: player.id }) }
        else
          render json: { message: 'Invalid username or password' }
        end
      end

      def auto_login
        "hi"
        # render json: player
      end

      private

      def player_params
        player_params = params.require(:player)

        player_params.permit(:username, :email, :password)
      end
    end
  end
end
