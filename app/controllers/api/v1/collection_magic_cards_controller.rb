module Api
  module V1
    class CollectionMagicCardsController < ApplicationController
      def index
        collection_magic_cards = CollectionMagicCard.all

        render json: collection_magic_cards
      end

      def show
        collection = if params[:boxset]
                       CollectionMagicCard.by_set(params[:id], params[:boxset])
                     else
                       CollectionMagicCard.by_id(params[:id])
                     end

        render json: collection, include: {
          magic_card: {
            except: %i[identifiers created_at updated_at text original_text],
            include: {
              boxset: {
                only: %i[name code]
              }
            }
          }
        }
      end

      def create
        collection_card = create_or_update_card(collection_magic_card_params)

        render json: collection_card, include: :magic_card
      end

      private

      def collection_magic_card_params
        collection_magic_card_params = params.require(:collection_magic_card)

        collection_magic_card_params.permit(
          :magic_card_id, :collection_id, :quantity, :condition, :notes, :foil_quantity
        )
      end

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
