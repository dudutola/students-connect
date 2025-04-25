class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :source
      t.string :icon
      t.string :url
      t.text :description
      t.text :overview

      t.timestamps
    end
  end
end
