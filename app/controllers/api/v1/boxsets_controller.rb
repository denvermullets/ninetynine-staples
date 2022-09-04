# typed: true

module Api
  module V1
    class BoxsetsController < ApplicationController
      extend T::Sig

      sig { returns(String) }
      def index
        boxsets = Boxset.all.order(release_date: :desc).where.not(total_set_size: 0)

        render json: boxsets
      end

      sig { returns(String) }
      def show
        boxset = Boxset.includes(magic_cards: { magic_card_color_idents: :color }).find(params[:id])

        render json: boxset,
               except: %i[created_at updated_at],
               include: {
                 magic_cards: {
                   except: %i[identifiers created_at updated_at text original_text],
                   include: {
                     magic_card_color_idents: {
                       except: %i[id magic_card_id color_id created_at updated_at],
                       include: {
                         color: {
                           only: :name
                         }
                       }
                     }
                   }
                 }
               }
      end
    end
  end
end
