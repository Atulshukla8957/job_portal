class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :profile_description
      t.integer :business_name_id
      t.datetime :establishment_date
      t.string :company_website_url

      t.timestamps
    end
  end
end
