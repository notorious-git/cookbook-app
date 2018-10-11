class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :directions
      t.string :image_url
      t.string :title
      t.integer :prep_time
      t.string :chef

      t.timestamps
    end
  end
end
