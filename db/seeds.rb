# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_artist = Artist.create(name: 'jason jason')
second_artist = Artist.create(name: 'ralph ralph')
third_artist = Artist.create(name: 'robbie robbie')

first_subtype = SubType.create(name: 'demon')
second_subtype = SubType.create(name: 'god')
third_subtype = SubType.create(name: 'aura')

first_supertype = SuperType.create(name: 'legendary')
second_supertype = SuperType.create(name: 'basic')
third_supertype = SuperType.create(name: 'snow')

first_cardtype = CardType.create(name: 'artifact')
second_cardtype = CardType.create(name: 'instant')
third_cardtype = CardType.create(name: 'creature')

first_boxset = Boxset.create(
  code: 'MID', mcm_id: 1234, name: 'Midnight Hunt', mcm_name: 'Midnights', release_date: '2021-10-01',
  base_set_size: 1243, total_set_size: 2234, set_type: 'expansion'
)
second_boxset = Boxset.create(
  code: 'VOW', mcm_id: 1234, name: 'Crimson Vow', mcm_name: 'Crimsons', release_date: '2021-08-01',
  base_set_size: 1243, total_set_size: 2234, set_type: 'expansion'
)
third_boxset = Boxset.create(
  code: 'CMD', mcm_id: 1234, name: 'Commander Legends', mcm_name: 'Commanders', release_date: '2020-04-01',
  base_set_size: 1243, total_set_size: 2234, set_type: 'expansion'
)

first_color = Color.create(name: 'U')
second_color = Color.create(name: 'B')
third_color = Color.create(name: 'G')

first_ruling = Ruling.create(ruling_date: '2021-10-01', ruling: 'jason is here')
second_ruling = Ruling.create(ruling_date: '2020-11-14', ruling: 'jason is invalid')
third_ruling = Ruling.create(ruling_date: '2019-07-23', ruling: 'robbie williams')

first_keyword = Keyword.create(keyword: 'flash')
second_keyword = Keyword.create(keyword: 'shroud')
third_keyword = Keyword.create(keyword: 'haste')

first_card = MagicCard.create(boxset_id: first_boxset.id, name: 'Damn', rarity: 'uncommon', has_foil: true, has_non_foil: true, is_reprint: false)
second_card = MagicCard.create(boxset_id: second_boxset.id, name: 'Wonder', rarity: 'mythic', has_foil: true, has_non_foil: true, is_reprint: false)
third_card = MagicCard.create(boxset_id: third_boxset.id, name: 'Chatterfang, General of Squirrels', rarity: 'rare', has_foil: true, has_non_foil: true, is_reprint: false)

Printing.create(magic_card_id: first_card.id, code: 'MH1')
Printing.create(magic_card_id: second_card.id, code: 'MH2')
Printing.create(magic_card_id: third_card.id, code: 'VOW')

MagicCardType.create(magic_card_id: first_card.id, card_type_id: first_cardtype.id)
MagicCardType.create(magic_card_id: second_card.id, card_type_id: second_cardtype.id)
MagicCardType.create(magic_card_id: third_card.id, card_type_id: third_cardtype.id)

MagicCardSuperType.create(magic_card_id: first_card.id, super_type_id: first_supertype.id)
MagicCardSuperType.create(magic_card_id: second_card.id, super_type_id: second_supertype.id)
MagicCardSuperType.create(magic_card_id: third_card.id, super_type_id: third_supertype.id)

MagicCardSubType.create(magic_card_id: first_card.id, sub_type_id: first_subtype.id)
MagicCardSubType.create(magic_card_id: second_card.id, sub_type_id: second_subtype.id)
MagicCardSubType.create(magic_card_id: third_card.id, sub_type_id: third_subtype.id)

MagicCardArtist.create(magic_card_id: first_card.id, artist_id: first_artist.id)
MagicCardArtist.create(magic_card_id: second_card.id, artist_id: second_artist.id)
MagicCardArtist.create(magic_card_id: third_card.id, artist_id: third_artist.id)

MagicCardColor.create(magic_card_id: first_card.id, color_id: first_color.id)
MagicCardColor.create(magic_card_id: second_card.id, color_id: second_color.id)
MagicCardColor.create(magic_card_id: third_card.id, color_id: third_color.id)

MagicCardColorIdent.create(magic_card_id: first_card.id, color_id: first_color.id)
MagicCardColorIdent.create(magic_card_id: second_card.id, color_id: second_color.id)
MagicCardColorIdent.create(magic_card_id: third_card.id, color_id: third_color.id)

MagicCardRuling.create(magic_card_id: first_card.id, ruling_id: first_ruling.id)
MagicCardRuling.create(magic_card_id: second_card.id, ruling_id: second_ruling.id)
MagicCardRuling.create(magic_card_id: third_card.id, ruling_id: third_ruling.id)

MagicCardKeyword.create(magic_card_id: first_card.id, keyword_id: first_keyword.id)
MagicCardKeyword.create(magic_card_id: second_card.id, keyword_id: second_keyword.id)
MagicCardKeyword.create(magic_card_id: third_card.id, keyword_id: third_keyword.id)

p 'seed file finished, no errors'