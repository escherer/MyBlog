class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :status
      t.text :bio
      t.text :location

      t.timestamps
    end
  end
end
