class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :body
      t.integer :owner_id
      t.timestamps
    end
  end
end
