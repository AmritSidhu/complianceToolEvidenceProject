class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :image2
      t.boolean :adminChecked
      t.string :adminComment
      t.timestamps
    end
  end
end
