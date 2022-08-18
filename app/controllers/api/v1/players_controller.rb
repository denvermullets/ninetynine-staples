# typed: strict

module Api
  module V1
    class PlayersController < ApplicationController
      extend T::Sig

      sig { returns(String) }
      def create
        player = Player.create(player_params)

        render json: player
      end

      private

      sig { returns(ActionController::Parameters) }
      def player_params
        player_params = T.cast(params.require(:player), ActionController::Parameters)

        player_params.permit(:name, :email)
      end
    end
  end
end
