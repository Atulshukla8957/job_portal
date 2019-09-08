class CreateEducationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :education_details do |t|
      t.string :degree_name
      t.string :stream
      t.string :institute_name
      t.datetime :start_date
      t.datetime :end_date
      t.float :percentage
      t.float :cgpa

      t.references :user
      t.timestamps
    end
  end
end
