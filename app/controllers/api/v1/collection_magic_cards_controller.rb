# typed: strict

module Api
  module V1
    class CollectionMagicCardsController < ApplicationController
      extend T::Sig

      sig { returns(String) }
      def index
        collection_magic_cards = CollectionMagicCard.all

        render json: collection_magic_cards
      end

      sig { returns(String) }
      def create
        new_collection_magic_card = CollectionMagicCard.create(collection_magic_card_params)

        render json: new_collection_magic_card
      end

      private

      sig { returns(ActionController::Parameters) }
      def collection_magic_card_params
        collection_magic_card_params = T.cast(params.require(:collection_magic_card), ActionController::Parameters)

        collection_magic_card_params.permit(:magic_card_id, :collection_id, :quantity, :condition)
      end
    end
  end
end
