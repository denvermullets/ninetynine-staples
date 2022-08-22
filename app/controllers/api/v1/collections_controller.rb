# typed: strict

module Api
  module V1
    class CollectionsController < ApplicationController
      extend T::Sig

      sig { returns(String) }
      def index
        collections = Collection.all

        render json: collections
      end

      sig { returns(String) }
      def create
        collection = Collection.create(collection_params)

        render json: collection
      end

      private

      sig { returns(ActionController::Parameters) }
      def collection_params
        collection_params = T.cast(params.require(:collection), ActionController::Parameters)

        collection_params.permit(:name, :description, :player_id)
      end
    end
  end
end
