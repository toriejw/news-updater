class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :title
      t.text :content
      t.text :image_url

      t.timestamps null: false
    end
  end
end
