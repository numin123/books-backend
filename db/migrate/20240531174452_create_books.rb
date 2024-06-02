class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :short_description
      t.text :full_description

      t.timestamps
    end
  end
end
