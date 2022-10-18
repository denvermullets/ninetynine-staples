require 'open-uri'

module Api
  module V1
    class IngestController < ApplicationController
      def ingest_cards
        if params[:ingest]
          IngestSets.perform_async
        elsif params[:wipe]
          CleanTables.perform_async
        elsif params[:set]
          source = URI.open('https://mtgjson.com/api/v5/SetList.json')
          all_info = JSON.parse(source.read)['data']

          set = all_info.filter { |single_set| single_set['code'] == params[:set] }.first

          IngestSetCards.perform_async(set)
        end
      end
    end
  end
end
