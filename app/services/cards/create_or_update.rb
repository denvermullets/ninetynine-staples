# this service will create, update, or delete a CollectionMagicCard
# CollectionMagicCard is the join of a MagicCard and a Player's Collection
module Cards
  class CreateOrUpdate < Service
    def initialize(params:)
      @card_params = params
      @magic_card_id = params[:magic_card_id]
      @collection_id = params[:collection_id]
      @quantity = params[:quantity]
      @foil_quantity = params[:foil_quantity]
      @card_info = MagicCard.find(@magic_card_id)
      @records = CollectionMagicCard.where(collection_id: @collection_id, magic_card_id: @magic_card_id)
    end

    def call
      if @records.length.zero?
        create_record
      elsif @records.length
        update_record(@records.first)

        @records.first.delete if nil_quantity
      end

      # returning nil if the card is deleted from the collection
      CollectionMagicCard.where(collection_id: @collection_id, magic_card_id: @magic_card_id).first
    end

    def create_record
      record = CollectionMagicCard.create(@card_params)
      record.update(total_value: calculate_value(record, @card_info))

      update_new_collection_value(record)
    end

    def update_record(record)
      record.update(@card_params)
      old_total_value = record.total_value
      record.update(total_value: calculate_value(record, @card_info))

      update_existing_collection_value(record, old_total_value)
    end

    def update_new_collection_value(record)
      collection = Collection.find(@collection_id)
      current_total = collection.total_value || 0
      collection.update(total_value: current_total + record.total_value)
    end

    def update_existing_collection_value(record, old_value)
      collection = Collection.find(@collection_id)
      current_total = collection.total_value || 0

      # calculating if we need to add or subtract the value
      if old_value < record.total_value
        collection.update(total_value: current_total + (record.total_value - old_value))
      else
        # if record.total_value = 0 we need to remove the old_value
        # otherwise we're probably ok to do old_value - record.total_value
        collection.update(total_value: current_total - calculate_value_change(old_value, record.total_value))
      end
    end

    def calculate_value_change(old_value, record)
      if record.positive?
        old_value - record
      else
        old_value
      end
    end

    def calculate_value(collection_record, card)
      normal_price = (collection_record.quantity || 0) * (card.normal_price || 0)
      foil_price = (collection_record.foil_quantity || 0) * (card.foil_price || 0)
      normal_price + foil_price
    end

    def nil_quantity
      quantity = @records.first.quantity
      foil_quantity = @records.first.foil_quantity

      (quantity.nil? || quantity.zero?) && (foil_quantity.nil? || foil_quantity.zero?)
    end
  end
end
