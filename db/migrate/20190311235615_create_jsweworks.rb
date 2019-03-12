class CreateJsweworks < ActiveRecord::Migration[5.2]
  def change
    create_table :jsweworks do |t|
      t.string :company
      t.string :description
      t.string :date
      t.string :link
      t.text :descriptionlong

      t.timestamps
    end
  end
end
