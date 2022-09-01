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
      def show
        collection = if params[:boxset]
                       CollectionMagicCard.by_set(params[:id], params[:boxset])
                     else
                       CollectionMagicCard.by_id(params[:id])
                     end

        render json: collection, include: :magic_card
      end

      sig { returns(String) }
      def create
        magic_card = T.let(collection_magic_card_params.to_h, T::Hash[Symbol, T.any(Integer, T.nilable(String))])
        collection_card = create_or_update_card(magic_card)

        render json: collection_card, include: :magic_card
      end

      private

      sig { returns(ActionController::Parameters) }
      def collection_magic_card_params
        collection_magic_card_params = T.cast(params.require(:collection_magic_card), ActionController::Parameters)

        collection_magic_card_params.permit(:magic_card_id, :collection_id, :quantity, :condition, :notes)
      end

      sig { params(magic_card: T::Hash[Symbol, T.any(Integer, T.nilable(String))]).returns(T.nilable(::CollectionMagicCard)) }
      def create_or_update_card(magic_card)
        # this is sort of a hybrid create method since we want it to create a new record or update an existing record
        # we won't ever have the CollectionMagicCard record id since it's a list of cards that can be updated in bulk
        collection_card = CollectionMagicCard.where(
          collection_id: magic_card[:collection_id], magic_card_id: magic_card[:magic_card_id]
        )

        if collection_card.length.zero?
          CollectionMagicCard.create(collection_magic_card_params)
        elsif collection_card.length
          collection_card.first.update(magic_card)
        end

        CollectionMagicCard.where(
          collection_id: magic_card[:collection_id], magic_card_id: magic_card[:magic_card_id]
        ).first
      end
    end
  end
end
