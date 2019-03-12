class CreateJsstackjobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jsstackjobs do |t|
      t.string :title
      t.string :link
      t.string :company
      t.string :skills
      t.string :date_posted
      t.text :description

      t.timestamps
    end
  end
end
