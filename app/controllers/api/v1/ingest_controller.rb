# typed: ignore

module Api
  module V1
    class IngestController < ApplicationController
      def ingest_cards
        puts 'hi, we are going to ingest now'

        IngestCards.perform_async
      end
    end
  end
end
