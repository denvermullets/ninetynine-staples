# typed: true

module Api
  module V1
    class BoxsetsController < ApplicationController
      extend T::Sig

      sig { returns(String) }
      def index
        boxsets = Boxset.all.order(release_date: :asc)

        render json: boxsets
      end

      sig { returns(String) }
      def show
        boxset = Boxset.includes(magic_cards: { magic_card_color_idents: :color }).find(params[:id])

        render json: boxset,
               include: { magic_cards: { include: { magic_card_color_idents: { include: { color: { only: :name } } } } } }
      end
    end
  end
end
