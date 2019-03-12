class CreateJscybercoders < ActiveRecord::Migration[5.2]
  def change
    create_table :jscybercoders do |t|
      t.string :job_link
      t.string :job_title
      t.string :job_location
      t.string :job_wage
      t.string :job_time
      t.string :job_skill_array
      t.text :job_description

      t.timestamps
    end
  end
end
