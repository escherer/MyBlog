class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :post_date
      t.string :post_title
      t.string :post_content
      t.string :post_tags
      t.boolean :post_status
      t.boolean :post_allow_comments

      t.timestamps
    end
  end
end
