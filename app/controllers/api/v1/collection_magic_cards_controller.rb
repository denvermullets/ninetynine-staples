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
        collection_card = Cards::CreateOrUpdate.call(params: collection_magic_card_params)

        if collection_card
          render json: collection_card, include: :magic_card, status: :ok
        else
          render json: { message: 'Card successfully deleted' }, status: :no_content
        end
      end

      private

      def collection_magic_card_params
        collection_magic_card_params = params.require(:collection_magic_card)

        collection_magic_card_params.permit(
          :magic_card_id, :collection_id, :quantity, :condition, :notes, :foil_quantity
        )
      end
    end
  end
end
