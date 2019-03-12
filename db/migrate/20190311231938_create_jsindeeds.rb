class CreateJsindeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :jsindeeds do |t|
      t.string :jobtitle
      t.string :company
      t.string :city
      t.string :state
      t.string :country
      t.string :source
      t.string :date
      t.string :link
      t.text :snippet

      t.timestamps
    end
  end
end
