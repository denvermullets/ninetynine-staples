# typed: strict

module Api
  module V1
    class MagicCardsController < ApplicationController
      extend T::Sig

      sig { returns(T::Array[JSON::Ext::Generator::GeneratorMethods::Object]) }
      def index
        all_cards = MagicCard.where(id: 1..100)

        render json: all_cards
      end
    end
  end
end
