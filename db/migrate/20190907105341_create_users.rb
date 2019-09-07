class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.boolean :is_active, default: true
      t.string :profile_pic
      t.string :page_cover
      t.string :password_digest
      t.string :reset_digest
      t.datetime :reset_sent_at


      t.timestamps
    end
  end
end
