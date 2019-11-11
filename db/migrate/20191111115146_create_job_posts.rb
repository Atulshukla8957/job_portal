class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
    	t.string :title
			t.text :description
			t.string :job_type
			t.string :location
			t.string :zipcode
			t.string :salary
			t.string :salary_type
			t.datetime :start_at
			t.datetime :expire_at
			t.boolean :active
			t.integer :company_id
			t.integer :user_id
      t.timestamps
    end
  end
end
