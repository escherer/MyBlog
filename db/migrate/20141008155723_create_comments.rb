class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :comment_content
      t.string :comment_date
      t.boolean :comment_approved
      t.integer :comment_rank

      t.timestamps
    end
  end
end
