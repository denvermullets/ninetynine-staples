# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :cards do
  task load: :environment do
    desc 'Load json file and iterate thru cards for populating db'
    source = URI.open('https://mtgjson.com/api/v5/AllPrintings.json')
    all_info = JSON.parse(source.read)['data']

    all_info.each do |set|
      set[1]['cards'].each do |card|
        p "creating #{card['name']}"
        p "reading setCode #{card['setCode']}"
        MagicCard.create(
          name: card['name'],
          text: card['text'],
          power: card.key?('power') ? card['power'] : nil,
          toughness: card.key?('toughness') ? card['toughness'] : nil,
          rarity: card['rarity'],
          set_code: card['setCode'],
          card_type: card['type']
        )
      end
    end
  end
end
