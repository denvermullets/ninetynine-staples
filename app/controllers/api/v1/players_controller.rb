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
        params.require(:player).permit(:name, :email)
      end
    end
  end
end
