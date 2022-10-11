module Api
  module V1
    class CollectionsController < ApplicationController
      def index
        collections = if params[:player_id]
                        Collection.by_player(params[:player_id])
                      else
                        Collection.all
                      end

        render json: collections
      end

      def create
        collection = Collection.create(collection_params)

        render json: collection
      end

      def show
        collection = Player.find_by(username: params[:username])&.collections&.find(params[:id])&.collection_magic_cards

        if collection
          filtered_cards = Cards::CollectionFilter.call(
            collection:, rarity: params[:rarity], color: params[:color], exact: params[:exact]
          )

          render json: filtered_cards, include: {
            magic_card: {
              only: %i[has_foil card_number image_medium rarity name border_color card_type mana_cost has_non_foil],
              include: {
                boxset: {
                  only: %i[name code]
                }
              }
            }
          }
        else
          render json: { message: 'Player and/or Collection does not exist' }, status: :not_found
        end
      end

      def filter_options
        collections = Player.find_by(username: params[:username])&.collections

        if collections
          render json: { collections:, boxsets: Boxset.all_sets  }
        else
          render json: { message: 'Player and/or Collections not found' }, status: :not_found
        end
      end

      private

      def collection_params
        collection_params = params.require(:collection)

        collection_params.permit(:name, :description, :player_id)
      end
    end
  end
end
