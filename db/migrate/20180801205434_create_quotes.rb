class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :author
      t.text :quote_text, null: false
      t.timestamp :recorded_at
      t.text :origin

      t.timestamps
    end
  end
end
