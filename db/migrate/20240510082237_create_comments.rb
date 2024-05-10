class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
