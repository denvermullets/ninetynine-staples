class UpdateCollectionValues
  include Sidekiq::Worker

  def perform(collection_to_update)
    puts "updating collection #{collection_to_update['collection_id']}"
    Cards::CreateOrUpdate.call(params: collection_to_update.symbolize_keys)
  end
end
