class CreateExperienceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_details do |t|
      t.string :job_title
      t.string :company_name
      t.boolean :is_current_job
      t.datetime :start_date
      t.datetime :end_date
      t.references :user

      t.timestamps
    end
  end
end
