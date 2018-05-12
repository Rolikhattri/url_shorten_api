class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :given_link
      t.string :short_link
      t.string :slug
      t.string :min_link

      t.timestamps
    end
  end
end
