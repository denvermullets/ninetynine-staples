class AddOtherFaceUuidToMagicCards < ActiveRecord::Migration[7.0]
  def change
    add_column :magic_cards, :other_face_uuid, :string
  end
end
