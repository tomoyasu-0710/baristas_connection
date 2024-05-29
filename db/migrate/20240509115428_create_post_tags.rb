class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.bigint :tag_id, null: false
      t.bigint :post_id, null: false
      t.timestamps
    end

    add_foreign_key :post_tags, :tags
    add_foreign_key :post_tags, :posts
     # 同じタグの２回保存は出来ないようにする
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end

