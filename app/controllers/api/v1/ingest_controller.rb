# typed: ignore

module Api
  module V1
    class IngestController < ApplicationController
      def ingest_cards
        if params[:ingest]
          puts 'hi, we are going to ingest now'

          IngestSets.perform_async
        elsif params[:wipe]
          CleanTables.perform_async
        end
      end
    end
  end
end
