class CreateRncareerbuilders < ActiveRecord::Migration[5.2]
  def change
    create_table :rncareerbuilders do |t|
      t.string :job_title
      t.text :job_description
      t.string :job_link
      t.string :job_date
      t.string :job_company

      t.timestamps
    end
  end
end
