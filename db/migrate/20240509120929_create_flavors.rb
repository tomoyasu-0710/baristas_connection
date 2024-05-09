class CreateFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :flavors do |t|
      t.string :flavor_name
      t.timestamps
    end
  end
end
