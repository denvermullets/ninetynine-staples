class QueUpdateCollectionValues
  include Sidekiq::Worker

  def perform(magic_card)
    puts "Going to find collections containing this card #{magic_card}"
    cards_in_collection = CollectionMagicCard.where(magic_card_id: magic_card)
    return unless cards_in_collection.length.positive?

    cards_in_collection.map do |collection|
      UpdateCollectionValues.perform_async(collection.attributes)
    end
  end
end
