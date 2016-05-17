class CreateTracksModel < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song
      t.string :author
      t.string :url
      t.timestamps
    end
  end
end
