class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :tag, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
    
     # 同じタグの２回保存は出来ないようにする
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end

