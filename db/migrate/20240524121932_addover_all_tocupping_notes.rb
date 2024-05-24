class AddoverAllTocuppingNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :cupping_notes, :over_all, :integer
  end
end
