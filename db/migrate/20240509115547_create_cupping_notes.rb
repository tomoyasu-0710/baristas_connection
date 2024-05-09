class CreateCuppingNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :cupping_notes do |t|
      t.string :sample_name
      t.integer :roast
      t.integer :dry
      t.integer :crust
      t.integer :break
      t.integer :flavor
      t.integer :after_taste
      t.integer :acidity
      t.integer :mouth_feel
      t.integer :clean_cup
      t.integer :sweetness
      t.integer :harmony
      t.string :memo
      t.integer :user_id
      t.timestamps
    end
  end
end
