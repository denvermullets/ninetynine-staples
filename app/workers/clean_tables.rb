class CleanTables
  include Sidekiq::Worker

  def perform
    puts 'deleting magic card color idents'
    MagicCardColorIdent.all.map(&:delete)
    puts 'done deleting magic card color idents'

    puts 'deleting magic card keywords'
    MagicCardKeyword.all.map(&:delete)
    puts 'done deleting magic card keywords'

    puts 'deleting magic card colors'
    MagicCardColor.all.map(&:delete)
    puts 'done deleting magic card colors'

    puts 'deleting magic card types'
    MagicCardType.all.map(&:delete)
    puts 'done deleting magic card types'

    puts 'deleting magic card super types'
    MagicCardSuperType.all.map(&:delete)
    puts 'done deleting magic card super types'

    puts 'deleting magic card sub type'
    MagicCardSubType.all.map(&:delete)
    puts 'done deleting magic card sub type'

    puts 'deleting magic card rulings'
    MagicCardRuling.all.map(&:delete)
    puts 'done deleting magic card rulings'

    # puts 'deleting rulings x2'
    # Rulings.all.map(&:delete)
    # puts 'done deleting rulings x2'
  end
end
