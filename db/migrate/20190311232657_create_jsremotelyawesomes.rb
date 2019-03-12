class CreateJsremotelyawesomes < ActiveRecord::Migration[5.2]
  def change
    create_table :jsremotelyawesomes do |t|
      t.string :job_link
      t.string :job_skills
      t.string :job_title
      t.string :job_company
      t.string :job_description

      t.timestamps
    end
  end
end
