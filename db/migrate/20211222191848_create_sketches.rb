class CreateSketches < ActiveRecord::Migration[7.0]
  def change
    create_table :sketches do |t|
      t.string :artist
      t.integer :upvotes

      t.timestamps
    end
  end
end
