# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :cards do
  task ingest: :environment do
    desc 'Load json file and iterate thru cards for populating db'

    def create_boxset(set)
      Boxset.create(
        code: set['code'],
        name: set['name'],
        release_date: set['releaseDate'],
        base_set_size: set['baseSetSize'],
        total_set_size: set['totalSetSize'],
        set_type: set['type']
      )
    end

    def create_magic_card(boxset, card)
      scryfall = card['identifiers']['scryfallId'].to_s
      res = HTTParty.get("https://api.scryfall.com/cards/#{scryfall}")

      if res
        large = res['image_uris']['large']
        normal = res['image_uris']['normal']
        small = res['image_uris']['small']
      end

      # respecting scryfall rate limit requests
      sleep 0.075

      MagicCard.create(
        boxset: boxset, name: card['name'], text: card['text'], original_text: card['originalText'],
        power: card['power'], toughness: card['toughness'], rarity: card['rarity'], card_type: card['type'],
        original_type: card['originalType'], edhrec_rank: card['edhrecRank'], has_foil: card['hasFoil'],
        has_non_foil: card['hasNonFoil'], border_color: card['borderColor'],
        converted_mana_cost: card['convertedManaCost'], flavor_text: card['flavorText'],
        frame_version: card['frameVersion'], is_reprint: card['isReprint'], card_number: card['number'],
        identifiers: card['identifiers'], card_uuid: card['uuid'], image_large: large,
        image_medium: normal, image_small: small, mana_cost: card['manaCost'], mana_value: card['manaValue'],
        face_name: card['faceName'], card_side: card['cardSide']
      )
    end

    def create_sub_type(card, sub_type)
      find_subtype = SubType.find_by(name: sub_type) || SubType.create(name: sub_type)
      MagicCardSubType.create(magic_card: card, sub_type: find_subtype)
    end

    def create_supertype(card, super_type)
      supertype = SuperType.find_by(name: super_type) || SuperType.create(name: super_type)
      MagicCardSuperType.create(magic_card: card, super_type: supertype)
    end

    def create_type(card, card_type)
      cardtype = CardType.find_by(name: card_type) || CardType.create(name: card_type)
      MagicCardType.create(magic_card: card, card_type: cardtype)
    end

    def create_color(card, color)
      card_color = Color.find_by(name: color) || Color.create(name: color)
      MagicCardColor.create(color: card_color, magic_card: card)
    end

    def create_color_ident(card, color)
      card_color = Color.find_by(name: color) || Color.create(name: color)
      MagicCardColorIdent.create(color: card_color, magic_card: card)
    end

    def create_ruling(card, ruling)
      rule = Ruling.create(ruling_date: ruling['date'], ruling: ruling['text'])
      MagicCardRuling.create(ruling: rule, magic_card: card)
    end

    def create_keywords(card, word)
      keyword = Keyword.find_by(keyword: word) || Keyword.create(keyword: word)
      MagicCardKeyword.create(magic_card: card, keyword: keyword)
    end

    puts 'loading AllPrintings.json from mtgjson.com'
    source = URI.open('https://mtgjson.com/api/v5/AllPrintings.json')
    puts 'completed loading AllPrintings.json from mtgjson.com'
    all_info = JSON.parse(source.read)['data']

    all_info.each do |key, value|
      puts "opening up #{key}"
      boxset = create_boxset(value)
      value['cards'].each do |card|
        # we want to make sure we only add paper cards now that there's digital only
        if card['availability'].include?('paper')
          puts "working on card #{card['name']}"
          magic_card = create_magic_card(boxset, card)
          artist = Artist.find_by(name: card['artist']) || Artist.create(name: card['artist'])
          MagicCardArtist.create(artist: artist, magic_card: magic_card)
          card['subtypes'].each { |sub_type| create_sub_type(magic_card, sub_type) }
          card['supertypes'].each { |super_type| create_supertype(magic_card, super_type) }
          card['types'].each { |card_type| create_type(magic_card, card_type) }
          card['colors'].each { |color| create_color(magic_card, color) }
          card['colorIdentity'].each { |color| create_color_ident(magic_card, color) }
          # not tracking printings for now since we can query the magic_card table
          # having some internal debate about storing it as a json column but that makes querying it difficult
          # which sort of defeats the purpose of storing the value at all :\
          # card['printings'].each { |print| Printing.create(boxset_code: print, magic_card: magic_card) }
          card['rulings'].each { |ruling| create_ruling(magic_card, ruling) }
          if card.key?('keywords')
            card['keywords'].each { |keyword| create_keywords(magic_card, keyword) }
          end
        end
      end
    end
  end
end
