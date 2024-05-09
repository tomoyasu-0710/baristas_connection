class CreateFlavorTags < ActiveRecord::Migration[6.1]
  def change
    create_table :flavor_tags do |t|
      t.integer :flavor_id
      t.integer :cupping_note_id
      t.timestamps
    end
  end
end
