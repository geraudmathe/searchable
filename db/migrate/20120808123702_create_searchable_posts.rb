class CreateSearchablePosts < ActiveRecord::Migration
  def change
    create_table :searchable_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
